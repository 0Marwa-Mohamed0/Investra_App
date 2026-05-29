class RequestModel {
  final dynamic id;
  final dynamic ideaId;
  final String senderId;
  final String receiverId;
  final String content;
  final String status;
  final DateTime createdAt;

  RequestModel({
    required this.id, required this.ideaId, required this.senderId,
    required this.receiverId, required this.content, required this.status,
    required this.createdAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      ideaId: json['idea_id'],
      senderId: json['sender_id']?.toString() ?? '',
      receiverId: json['receiver_id']?.toString() ?? '',
      content: json['content'] ?? '',
      status: json['status'] ?? 'pending',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }
}