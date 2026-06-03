import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';

class ChatSupabaseService {
        final _sb = Supabase.instance.client;

        String get _myId => _sb.auth.currentUser!.id;

        // ── 1. جيب كل الشاتات الخاصة بالمستخدم ─────────────────────────────────
        Future<List<ChatContact>> fetchChats() async {
                final rows = await _sb
                    .from('chat')
                    .select('''
          chat_id,
          idea_id,
          entrepreneur_id,
          investor_id,
          created_at,
          ideas(title),
          message(
            messageid,
            "Message text",
            "time stamp",
            sender_id,
            "is read"
          )
        ''')
                    .or('entrepreneur_id.eq.$_myId,investor_id.eq.$_myId');

                final List<ChatContact> contacts = [];

                for (final row in rows) {
                        final bool iAmEntrepreneur = row['entrepreneur_id'] == _myId;
                        final String peerId =
                        iAmEntrepreneur ? row['investor_id'] : row['entrepreneur_id'];

                        final profileRow = await _sb
                            .from('User')
                            .select('FullName, email')
                            .eq('userid', peerId)
                            .maybeSingle();

                        String fullName = profileRow?['FullName'] ?? 'User';
                        String? avatar;

                        final p = await _sb
                            .from('profile')
                            .select('profile_picture')
                            .eq('userid', peerId)
                            .maybeSingle();
                        avatar = p?['profile_picture'];

                        if (fullName == 'User') {
                                final nameFromProfile = await _sb
                                    .from('profile')
                                    .select('FullName')
                                    .eq('userid', peerId)
                                    .maybeSingle();
                                if (nameFromProfile != null) fullName = nameFromProfile['FullName'];
                        }

                        final List msgs = row['message'] ?? [];
                        msgs.sort((a, b) =>
                            (a['time stamp'] ?? '').compareTo(b['time stamp'] ?? ''));

                        final lastMsg = msgs.isNotEmpty ? msgs.last : null;
                        final String preview = lastMsg?['Message text'] ?? '...';

                        // ✅ عدد الرسائل غير المقروءة المبعوتالي أنا فقط
                        final int unreadCount = msgs
                            .where((m) =>
                        m['sender_id'] != _myId && (m['is read'] == false))
                            .length;

                        final String timeAgo = lastMsg != null
                            ? _formatTime(DateTime.parse(lastMsg['time stamp']).toLocal())
                            : '';

                        final String role =
                        row['investor_id'] == peerId ? 'INVESTOR' : 'ENTREPRENEUR';

                        contacts.add(ChatContact(
                                id: row['chat_id'],
                                fullName: fullName,
                                roleSubtitle: role,
                                avatarUrl: avatar,
                                lastMessagePreview: preview,
                                timeAgo: timeAgo,
                                unreadCount: unreadCount,
                                topicLabel: row['ideas']?['title'],
                                lastMessageTime: lastMsg != null
                                    ? DateTime.parse(lastMsg['time stamp']).toLocal()
                                    : DateTime.parse(row['created_at']).toLocal(),
                        ));
                }

                contacts.sort((a, b) =>
                    (b.lastMessageTime ?? DateTime(2000))
                        .compareTo(a.lastMessageTime ?? DateTime(2000)));

                return contacts;
        }

        // ── 2. جيب رسائل شات معين ────────────────────────────────────────────────
        Future<List<ChatMessage>> fetchMessages(String chatId) async {
                final rows = await _sb
                    .from('message')
                    .select('messageid, "Message text", sender_id, "is read", "time stamp"')
                    .eq('chat_id', chatId)
                    .order('time stamp', ascending: true);

                return rows.map((r) {
                        final dt = DateTime.tryParse(r['time stamp'] ?? '')?.toLocal();
                        return ChatMessage(
                                id: r['messageid'].toString(),
                                text: r['Message text'] ?? '',
                                isFromUser: r['sender_id'] == _myId,
                                timeLabel: dt != null ? _formatTime(dt) : '',
                                isRead: r['is read'] ?? false,
                        );
                }).toList();
        }

        // ── 3. ابعت رسالة ────────────────────────────────────────────────────────
        Future<void> sendMessage({
                required String chatId,
                required String text,
        }) async {
                await _sb.from('message').insert({
                        'chat_id': chatId,
                        'sender_id': _myId,
                        'Message text': text,
                        'is read': false,
                });
        }

        // ── 4. ✅ علّم كل الرسائل المبعوتالي في الشات كـ "مقروءة" ──────────────
        Future<void> markMessagesAsRead(String chatId) async {
                await _sb
                    .from('message')
                    .update({'is read': true})
                    .eq('chat_id', chatId)
                    .neq('sender_id', _myId)
                    .eq('is read', false);
        }

        // ── 5. ✅ Realtime — استنى رسائل جديدة أو تحديثات (قراءة) ───────────────
        //
        // الجديد: أضفنا channel منفصل لمراقبة جدول message لكل تغيير
        // عشان لما حد تاني يدخل الشات، نحدث علامات الصح فوراً
        RealtimeChannel subscribeToMessages({
                required String chatId,
                required void Function(ChatMessage msg) onNewMessage,
                required void Function(String messageId, bool isRead) onMessageRead,
        }) {
                return _sb
                    .channel('chat_messages:$chatId')
                    .onPostgresChanges(
                        event: PostgresChangeEvent.insert,
                        schema: 'public',
                        table: 'message',
                        filter: PostgresChangeFilter(
                                type: PostgresChangeFilterType.eq,
                                column: 'chat_id',
                                value: chatId,
                        ),
                        callback: (payload) {
                                final r = payload.newRecord;
                                final dt = DateTime.tryParse(r['time stamp'] ?? '')?.toLocal();
                                final msg = ChatMessage(
                                        id: r['messageid']?.toString() ?? '',
                                        text: r['Message text'] ?? '',
                                        isFromUser: r['sender_id'] == _myId,
                                        timeLabel: dt != null ? _formatTime(dt) : '',
                                        isRead: r['is read'] ?? false,
                                );
                                onNewMessage(msg);
                        },
                )
                    .onPostgresChanges(
                        event: PostgresChangeEvent.update,
                        schema: 'public',
                        table: 'message',
                        filter: PostgresChangeFilter(
                                type: PostgresChangeFilterType.eq,
                                column: 'chat_id',
                                value: chatId,
                        ),
                        callback: (payload) {
                                final r = payload.newRecord;
                                // ✅ لما يتحدث "is read" لـ true → حدّث علامات الصح فوراً
                                if (r['is read'] == true) {
                                        onMessageRead(r['messageid'].toString(), true);
                                }
                        },
                )
                    .subscribe();
        }

        // ── 6. ✅ Realtime لقائمة الشات — يراقب جدول message كله للمستخدم ────────
        //
        // بنستخدمه في MessagesListScreen عشان نحدث الـ unreadCount فوراً
        // بدون الحاجة لإعادة fetch كاملة
        RealtimeChannel subscribeToAllMyMessages({
                required void Function() onAnyChange,
        }) {
                return _sb
                    .channel('all_my_chats_$_myId')
                    .onPostgresChanges(
                        event: PostgresChangeEvent.all,
                        schema: 'public',
                        table: 'message',
                        callback: (_) => onAnyChange(),
                )
                    .subscribe();
        }

        // ── 7. اعمل شات جديد (لو مش موجود) ────────────────────────────────────
        Future<String> getOrCreateChat({
                required String otherUserId,
                required String ideaId,
        }) async {
                final iAmEntrepreneur = await _isEntrepreneur();

                final entrepreneurId = iAmEntrepreneur ? _myId : otherUserId;
                final investorId = iAmEntrepreneur ? otherUserId : _myId;

                final existing = await _sb
                    .from('chat')
                    .select('chat_id')
                    .eq('entrepreneur_id', entrepreneurId)
                    .eq('investor_id', investorId)
                    .eq('idea_id', ideaId)
                    .maybeSingle();

                if (existing != null) return existing['chat_id'];

                final created = await _sb
                    .from('chat')
                    .insert({
                        'entrepreneur_id': entrepreneurId,
                        'investor_id': investorId,
                        'idea_id': ideaId,
                })
                    .select('chat_id')
                    .single();

                return created['chat_id'];
        }

        // ── Helpers ──────────────────────────────────────────────────────────────
        Future<bool> _isEntrepreneur() async {
                final row = await _sb
                    .from('User')
                    .select('role')
                    .eq('userid', _myId)
                    .maybeSingle();
                return row?['role'] == 'Entrepreneur';
        }

        String _formatTime(DateTime dt) {
                final now = DateTime.now();
                final diff = now.difference(dt);
                if (diff.inDays == 0) {
                        final h = dt.hour > 12
                            ? dt.hour - 12
                            : dt.hour == 0
                            ? 12
                            : dt.hour;
                        final m = dt.minute.toString().padLeft(2, '0');
                        final ampm = dt.hour < 12 ? 'AM' : 'PM';
                        return '$h:$m $ampm';
                }
                if (diff.inDays == 1) return 'Yesterday';
                if (diff.inDays < 7) return '${diff.inDays}d';
                return '${dt.day}/${dt.month}';
        }
}
