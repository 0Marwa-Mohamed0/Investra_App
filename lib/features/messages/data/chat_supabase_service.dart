import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';

class ChatSupabaseService {
  final _sb = Supabase.instance.client;

  String get _myId => _sb.auth.currentUser!.id;

  // ── 1. جيب كل الشاتات ───────────────────────────────────────────────────
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
            message_type
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
          .select('FullName')
          .eq('userid', peerId)
          .maybeSingle();

      String fullName = profileRow?['FullName'] ?? 'User';

      final p = await _sb
          .from('profile')
          .select('profile_picture, FullName')
          .eq('userid', peerId)
          .maybeSingle();
      final String? avatar = p?['profile_picture'];
      if (fullName == 'User' && p?['FullName'] != null) {
        fullName = p!['FullName'];
      }

      final List msgs = row['message'] ?? [];
      msgs.sort((a, b) =>
          (a['time stamp'] ?? '').compareTo(b['time stamp'] ?? ''));

      final lastMsg = msgs.isNotEmpty ? msgs.last : null;
      final String preview = lastMsg == null
          ? '...'
          : (lastMsg['message_type'] == 'nda'
          ? '📄 NDA Agreement'
          : lastMsg['Message text'] ?? '...');

      const int unreadCount = 0;

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
        .select(
        'messageid, "Message text", sender_id, "time stamp", "is read", message_type')
        .eq('chat_id', chatId)
        .order('time stamp', ascending: true);

    return rows.map((r) {
      final dt = DateTime.tryParse(r['time stamp'] ?? '')?.toLocal();
      return ChatMessage(
        id: r['messageid'].toString(),
        text: r['Message text'] ?? '',
        isFromUser: r['sender_id'] == _myId,
        timeLabel: dt != null ? _formatTime(dt) : '',
        isRead: r['is read'] == true,
        messageType: r['message_type'] ?? 'text',
      );
    }).toList();
  }


  Future<void> sendMessage({
    required String chatId,
    required String text,
  }) async {
    await _sb.from('message').insert({
      'chat_id': chatId,
      'sender_id': _myId,
      'Message text': text,
      'is read': false,
      'message_type': 'text',
    });
  }


  Future<void> sendNdaRequest({required String chatId}) async {
    await _sb.from('message').insert({
      'chat_id': chatId,
      'sender_id': _myId,
      'Message text': 'NDA_REQUEST',
      'is read': false,
      'message_type': 'nda',
    });
  }


  Future<void> markMessagesAsRead(String chatId) async {
    await _sb
        .from('message')
        .update({'is read': true})
        .eq('chat_id', chatId)
        .neq('sender_id', _myId)
        .eq('is read', false);
  }


  Stream<List<Map<String, dynamic>>> streamMessages(String chatId) {
    return _sb
        .from('message')
        .stream(primaryKey: ['messageid'])
        .eq('chat_id', chatId)
        .order('time stamp', ascending: true);
  }


  Stream<List<Map<String, dynamic>>> streamAllMessages() {
    return _sb.from('message').stream(primaryKey: ['messageid']);
  }


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