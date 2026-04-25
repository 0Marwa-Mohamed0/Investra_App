/// Single line in a thread (outgoing = current user).
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.timeLabel,
    this.isRead = true,
  });

  final String id;
  final String text;
  final bool isFromUser;
  final String timeLabel;
  final bool isRead;
}
