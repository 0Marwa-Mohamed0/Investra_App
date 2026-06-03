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

  ChatMessage copyWith({bool? isRead}) {
    return ChatMessage(
      id: id,
      text: text,
      isFromUser: isFromUser,
      timeLabel: timeLabel,
      isRead: isRead ?? this.isRead,
    );
  }
}
