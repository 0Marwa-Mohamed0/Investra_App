class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.timeLabel,
    required this.isRead,
    this.messageType = 'text',
  });

  final String id;
  final String text;
  final bool isFromUser;
  final String timeLabel;
  final bool isRead;
  final String messageType;

  bool get isNda => messageType == 'nda';
}
