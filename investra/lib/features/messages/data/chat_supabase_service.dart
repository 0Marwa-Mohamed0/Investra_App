import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';

class ChatSupabaseService {
  final _sb = Supabase.instance.client;

  String get _myId => _sb.auth.currentUser!.id;

  // ─── 1. جيب كل الشاتات الخاصة بالمستخدم الحالي ───────────────────────────
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
            "Message text",
            time stamp,
            sender_id
          )
        ''')
        .or('entrepreneur_id.eq.$_myId,investor_id.eq.$_myId')
        .order('created_at', ascending: false);

    final List<ChatContact> contacts = [];

    for (final row in rows) {
      // الطرف الثاني في الشات (مش أنا)
      final bool iAmEntrepreneur = row['entrepreneur_id'] == _myId;
      final String peerId = iAmEntrepreneur
          ? row['investor_id']
          : row['entrepreneur_id'];

      // جيب بيانات الطرف الثاني من profile
      final profileRow = await _sb
          .from('profile')
          .select('FullName, profile_picture, email')
          .eq('userid', peerId)
          .maybeSingle();

      final String fullName = profileRow?['FullName'] ?? 'Unknown';
      final String? avatar = profileRow?['profile_picture'];

      // آخر رسالة
      final List msgs = row['message'] ?? [];
      msgs.sort((a, b) => (a['time stamp'] ?? '')
          .compareTo(b['time stamp'] ?? ''));
      final lastMsg = msgs.isNotEmpty ? msgs.last : null;
      final String preview = lastMsg?['Message text'] ?? '...';
      final String timeAgo = lastMsg != null
          ? _formatTime(DateTime.parse(lastMsg['time stamp']))
          : '';

      // role الطرف الثاني
      final roleRow = await _sb
          .from('profile')
          .select('investor_details, entrepreneur_details')
          .eq('userid', peerId)
          .maybeSingle();
      final String role = roleRow?['investor_details'] != null
          ? 'INVESTOR'
          : 'ENTREPRENEUR';

      contacts.add(ChatContact(
        id: row['chat_id'],
        fullName: fullName,
        roleSubtitle: role,
        avatarUrl: avatar,
        lastMessagePreview: preview,
        timeAgo: timeAgo,
        topicLabel: row['ideas']?['title'],
        lastMessageTime: lastMsg != null
            ? DateTime.parse(lastMsg['time stamp'])
            : DateTime.parse(row['created_at']),
      ));
    }

    return contacts;
  }

  // ─── 2. جيب رسايل شات معين ────────────────────────────────────────────────
  Future<List<ChatMessage>> fetchMessages(String chatId) async {
    final rows = await _sb
        .from('message')
        .select('messageid, "Message text", sender_id, is read, "time stamp"')
        .eq('chat_id', chatId)
        .order('time stamp', ascending: true);

    return rows.map((r) {
      final dt = DateTime.tryParse(r['time stamp'] ?? '');
      return ChatMessage(
        id: r['messageid'],
        text: r['Message text'] ?? '',
        isFromUser: r['sender_id'] == _myId,
        timeLabel: dt != null ? _formatTime(dt) : '',
        isRead: r['is read'] ?? false,
      );
    }).toList();
  }

  // ─── 3. ابعت رسالة ────────────────────────────────────────────────────────
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

  // ─── 4. Realtime — استنى رسايل جديدة ─────────────────────────────────────
  RealtimeChannel subscribeToMessages({
    required String chatId,
    required void Function(ChatMessage msg) onNewMessage,
  }) {
    return _sb
        .channel('messages:$chatId')
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
        final dt = DateTime.tryParse(r['time stamp'] ?? '');
        final msg = ChatMessage(
          id: r['messageid'] ?? '',
          text: r['Message text'] ?? '',
          isFromUser: r['sender_id'] == _myId,
          timeLabel: dt != null ? _formatTime(dt) : '',
          isRead: r['is read'] ?? false,
        );
        onNewMessage(msg);
      },
    )
        .subscribe();
  }

  // ─── 5. اعمل شات جديد (لو مش موجود) ─────────────────────────────────────
  Future<String> getOrCreateChat({
    required String otherUserId,
    required String ideaId,
  }) async {
    final iAmEntrepreneur = await _isEntrepreneur();

    final entrepreneurId = iAmEntrepreneur ? _myId : otherUserId;
    final investorId = iAmEntrepreneur ? otherUserId : _myId;

    // دور لو في شات موجود
    final existing = await _sb
        .from('chat')
        .select('chat_id')
        .eq('entrepreneur_id', entrepreneurId)
        .eq('investor_id', investorId)
        .eq('idea_id', ideaId)
        .maybeSingle();

    if (existing != null) return existing['chat_id'];

    // عمل شات جديد
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

  // ─── Helpers ──────────────────────────────────────────────────────────────
  Future<bool> _isEntrepreneur() async {
    final row = await _sb
        .from('profile')
        .select('entrepreneur_details')
        .eq('userid', _myId)
        .maybeSingle();
    return row?['entrepreneur_details'] != null;
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) {
      final h = dt.hour > 12 ? dt.hour - 12 : dt.hour == 0 ? 12 : dt.hour;
      final m = dt.minute.toString().padLeft(2, '0');
      final ampm = dt.hour < 12 ? 'AM' : 'PM';
      return '$h:$m $ampm';
    }
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${dt.day}/${dt.month}';
  }
}