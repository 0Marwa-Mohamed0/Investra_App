class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final String? sourceId;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.sourceId,
  });

  // تحويل البيانات القادمة من Supabase إلى Object
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      type: json['type'] ?? 'general',
      isRead: json['is_read'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      sourceId: json['source_id'],
    );
  }
}