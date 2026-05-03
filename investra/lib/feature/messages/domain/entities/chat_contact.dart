/// Conversation row / peer shown in the messages list and chat header.
class ChatContact {
  const ChatContact({
    required this.id,
    required this.fullName,
    required this.roleSubtitle,
    this.avatarUrl,
    required this.lastMessagePreview,
    required this.timeAgo,
    this.unreadCount = 0,
    this.isOnline = false,
    this.topicLabel,
  });

  final String id;
  final String fullName;
  final String roleSubtitle;
  final String? avatarUrl;
  final String lastMessagePreview;
  final String timeAgo;
  final int unreadCount;
  final bool isOnline;
  final String? topicLabel;
}
