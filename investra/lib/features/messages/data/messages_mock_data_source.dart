import 'package:investra/features/messages/domain/entities/chat_contact.dart';
import 'package:investra/features/messages/domain/entities/chat_message.dart';
import 'package:investra/features/messages/domain/entities/chat_thread_item.dart';

/// In-memory mock data for the messaging feature (replace with API later).
class MessagesMockDataSource {
  const MessagesMockDataSource._();

  static const String _placeholder =
      'https://ui-avatars.com/api/?background=1E4B76&color=fff&name=';

  static List<ChatContact> get allContacts {
    return [
      const ChatContact(
        id: '1',
        fullName: 'Amina Khan',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'Check in',
        timeAgo: 'Yesterday',
        unreadCount: 2,
        isOnline: true,
        topicLabel: 'SolarTech Q4 Expansion',
        avatarUrl: '$_placeholder' 'Amina+Khan',
      ),
      const ChatContact(
        id: '2',
        fullName: 'Jameson Oduro',
        roleSubtitle: 'VENTURE PARTNER',
        lastMessagePreview: 'See you soon',
        timeAgo: '5h',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'AgriNode Seed Round',
        avatarUrl: '$_placeholder' 'Jameson+Oduro',
      ),
      const ChatContact(
        id: '3',
        fullName: 'Elena Kovac',
        roleSubtitle: 'L.P.',
        lastMessagePreview: 'Sent a photo',
        timeAgo: '2h',
        unreadCount: 1,
        isOnline: true,
        topicLabel: 'Finstack Due Diligence',
        avatarUrl: '$_placeholder' 'Elena+Kovac',
      ),
      const ChatContact(
        id: '4',
        fullName: 'Ismail Al-Fadel',
        roleSubtitle: 'FAMILY OFFICE',
        lastMessagePreview: 'liked a message',
        timeAgo: '7d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'REIT follow-up',
        avatarUrl: '$_placeholder' 'Ismail+Al-Fadel',
      ),
      const ChatContact(
        id: '5',
        fullName: 'Layla Saad',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'Weekend plan',
        timeAgo: '1d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Bridge round terms',
        avatarUrl: '$_placeholder' 'Layla+Saad',
      ),
      const ChatContact(
        id: '6',
        fullName: 'Mirna omar',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'I will review the deck tonight.',
        timeAgo: '3h',
        unreadCount: 0,
        isOnline: true,
        topicLabel: 'SolarTech Q4 Expansion',
        avatarUrl: '$_placeholder' 'Mirna+Omar',
      ),
      const ChatContact(
        id: '7',
        fullName: 'Omar Haddad',
        roleSubtitle: 'INVESTMENT DIRECTOR',
        lastMessagePreview: 'Can we move the call to Tuesday?',
        timeAgo: '1h',
        unreadCount: 0,
        isOnline: true,
        topicLabel: 'MENA expansion',
        avatarUrl: '$_placeholder' 'Omar+Haddad',
      ),
      const ChatContact(
        id: '8',
        fullName: 'Sofia Reyes',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'Thanks for the cap table.',
        timeAgo: '4h',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Series A docs',
        avatarUrl: '$_placeholder' 'Sofia+Reyes',
      ),
      const ChatContact(
        id: '9',
        fullName: 'Yuki Tanaka',
        roleSubtitle: 'STRATEGIC PARTNER',
        lastMessagePreview: 'Pushed the updated NDA to your email.',
        timeAgo: '6h',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'APAC intro',
        avatarUrl: '$_placeholder' 'Yuki+Tanaka',
      ),
      const ChatContact(
        id: '10',
        fullName: 'Leo Vance',
        roleSubtitle: 'VENTURE PARTNER',
        lastMessagePreview: 'Let me sync with legal first.',
        timeAgo: '2d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Options pool',
        avatarUrl: '$_placeholder' 'Leo+Vance',
      ),
      const ChatContact(
        id: '11',
        fullName: 'Hannah Brooks',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'Weekend plan',
        timeAgo: '3d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Dublin office visit',
        avatarUrl: '$_placeholder' 'Hannah+Brooks',
      ),
      const ChatContact(
        id: '12',
        fullName: 'Ravi Patel',
        roleSubtitle: 'FAMILY OFFICE',
        lastMessagePreview: 'Numbers look solid in Q1.',
        timeAgo: '5d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Q1 review',
        avatarUrl: '$_placeholder' 'Ravi+Patel',
      ),
      const ChatContact(
        id: '13',
        fullName: 'Claire DeLuca',
        roleSubtitle: 'L.P.',
        lastMessagePreview: 'I shared this with the committee.',
        timeAgo: '1d',
        unreadCount: 0,
        isOnline: true,
        topicLabel: 'Committee read-out',
        avatarUrl: '$_placeholder' 'Claire+DeLuca',
      ),
      const ChatContact(
        id: '14',
        fullName: 'Niko Anders',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'Can we get a 15m slot tomorrow?',
        timeAgo: '8h',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Product demo',
        avatarUrl: '$_placeholder' 'Niko+Anders',
      ),
      const ChatContact(
        id: '15',
        fullName: 'Maya Idris',
        roleSubtitle: 'VENTURE PARTNER',
        lastMessagePreview: 'Sent the LOI comments.',
        timeAgo: '12h',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'LOI review',
        avatarUrl: '$_placeholder' 'Maya+Idris',
      ),
      const ChatContact(
        id: '16',
        fullName: 'Ethan Morse',
        roleSubtitle: 'FAMILY OFFICE',
        lastMessagePreview: 'Great meeting everyone.',
        timeAgo: 'Sat',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Advisory call',
        avatarUrl: '$_placeholder' 'Ethan+Morse',
      ),
      const ChatContact(
        id: '17',
        fullName: 'Zara Nasser',
        roleSubtitle: 'ANGEL INVESTOR',
        lastMessagePreview: 'Uploading the signed PDF now.',
        timeAgo: '20m',
        unreadCount: 0,
        isOnline: true,
        topicLabel: 'SAFT closing',
        avatarUrl: '$_placeholder' 'Zara+Nasser',
      ),
      const ChatContact(
        id: '18',
        fullName: 'Derek Wu',
        roleSubtitle: 'INVESTMENT DIRECTOR',
        lastMessagePreview: 'Pinging finance for a refresh.',
        timeAgo: '3d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Audit window',
        avatarUrl: '$_placeholder' 'Derek+Wu',
      ),
      const ChatContact(
        id: '19',
        fullName: 'Irene Papadopoulos',
        roleSubtitle: 'L.P.',
        lastMessagePreview: 'Will follow up on EU regulations.',
        timeAgo: '4d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'Regulatory Q&A',
        avatarUrl: '$_placeholder' 'Irene+Pa',
      ),
      const ChatContact(
        id: '20',
        fullName: 'Victor Mensa',
        roleSubtitle: 'STRATEGIC PARTNER',
        lastMessagePreview: 'Introduced you to the CFO.',
        timeAgo: '6d',
        unreadCount: 0,
        isOnline: false,
        topicLabel: 'CFO intro',
        avatarUrl: '$_placeholder' 'Victor+Mensa',
      ),
    ];
  }

  static final Map<String, List<ChatThreadItem>> _threadStore = {
    '1': List<ChatThreadItem>.of(_aminaThread),
    '6': List<ChatThreadItem>.of(_mirnaThread),
  };

  static List<ChatThreadItem> initialThreadFor(String contactId) {
    final existing = _threadStore[contactId];
    if (existing != null) {
      return List<ChatThreadItem>.of(existing);
    }

    final created = List<ChatThreadItem>.of(_defaultThread);
    _threadStore[contactId] = created;
    return List<ChatThreadItem>.of(created);
  }

  static void appendUserMessage({
    required String contactId,
    required String text,
    required String timeLabel,
  }) {
    final thread = _threadStore.putIfAbsent(
      contactId,
      () => List<ChatThreadItem>.of(_defaultThread),
    );

    thread.add(
      ChatMessageItem(
        ChatMessage(
          id: 'm_${DateTime.now().microsecondsSinceEpoch}',
          text: text,
          isFromUser: true,
          timeLabel: timeLabel,
          isRead: true,
        ),
      ),
    );
  }

  static String lastMessagePreviewFor(
    String contactId, {
    required String fallback,
  }) {
    final thread = _threadStore.putIfAbsent(
      contactId,
      () => List<ChatThreadItem>.of(_defaultThread),
    );

    for (var i = thread.length - 1; i >= 0; i--) {
      final item = thread[i];
      if (item is ChatMessageItem) {
        return item.message.text;
      }
    }
    return fallback;
  }

  static const List<ChatThreadItem> _mirnaThread = [
    ChatDateSeparatorItem('YESTERDAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'm1',
        text: 'Here is the updated forecast—let me know if the assumptions look right on your side.',
        isFromUser: false,
        timeLabel: '4:12 PM',
        isRead: true,
      ),
    ),
    ChatMessageItem(
      ChatMessage(
        id: 'm2',
        text: 'Thanks, Mirna. I will align with the team and send a revised slide by evening.',
        isFromUser: true,
        timeLabel: '4:15 PM',
        isRead: true,
      ),
    ),
    ChatDateSeparatorItem('TODAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'm3',
        text: 'Noted. Can we add a one-pager on unit economics to the data room?',
        isFromUser: false,
        timeLabel: '9:20 AM',
        isRead: true,
      ),
    ),
  ];

  static const List<ChatThreadItem> _aminaThread = [
    ChatDateSeparatorItem('TODAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'a1',
        text: 'Check in on the diligence timeline when you can.',
        isFromUser: false,
        timeLabel: '10:05 AM',
        isRead: true,
      ),
    ),
  ];

  static const List<ChatThreadItem> _defaultThread = [
    ChatDateSeparatorItem('TODAY'),
    ChatMessageItem(
      ChatMessage(
        id: 'd1',
        text: 'Let me know a good time to connect this week.',
        isFromUser: false,
        timeLabel: '11:00 AM',
        isRead: true,
      ),
    ),
  ];
}
