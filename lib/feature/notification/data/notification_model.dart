class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  // الأعمدة الجديدة اللي أضفتيها في Supabase
  final String? ideaId;
  final String? requestId;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.ideaId,
    this.requestId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      type: json['type'],
      isRead: json['is_read'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      // السطرين دول هم اللي ناقصين عندك في الصورة!
      ideaId: json['idea_id'],
      requestId: json['request_id'],
    );
  }
}