import 'dart:convert';

class AiSession {
  final String sessionId;
  final String userId;
  final String title;
  final String? lastMessageSnippet;
  final DateTime createdAt;

  AiSession({
    required this.sessionId,
    required this.userId,
    required this.title,
    this.lastMessageSnippet,
    required this.createdAt,
  });

  factory AiSession.fromJson(Map<String, dynamic> json) {
    return AiSession(
      sessionId: json['session_id'] ?? '',
      userId: json['user_id'] ?? '',
      title: json['title'] ?? 'Chat',
      lastMessageSnippet: json['last_message_snippet'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'user_id': userId,
      'title': title,
      'last_message_snippet': lastMessageSnippet,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class AiMessage {
  final String messageId;
  final String sessionId;
  final String senderRole;
  final String content;
  final String? fileUrl;
  final String? fileName;
  final DateTime createdAt;

  AiMessage({
    required this.messageId,
    required this.sessionId,
    required this.senderRole,
    required this.content,
    this.fileUrl,
    this.fileName,
    required this.createdAt,
  });

  bool get isAi => senderRole == 'assistant';

  factory AiMessage.fromJson(Map<String, dynamic> json) {
    return AiMessage(
      messageId: json['message_id'] ?? '',
      sessionId: json['session_id'] ?? '',
      senderRole: json['sender_role'] ?? 'user',
      content: json['content'] ?? '',
      fileUrl: json['file_url'],
      fileName: json['file_name'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'session_id': sessionId,
      'sender_role': senderRole,
      'content': content,
      'file_url': fileUrl,
      'file_name': fileName,
      'created_at': createdAt.toIso8601String(),
    };
  }
}