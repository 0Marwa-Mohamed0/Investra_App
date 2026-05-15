class ProfileModel {
  final String userId;
  final String fullName;
  final String? profilePicture;
  final String? bio;
  final String role;
  final DateTime joinedAt;
  final int totalActivity;
  final int activeChats;

  ProfileModel({
    required this.userId,
    required this.fullName,
    this.profilePicture,
    this.bio,
    required this.role,
    required this.joinedAt,
    required this.totalActivity,
    required this.activeChats,
  });

  // المصنع لتحويل البيانات من الـ View إلى كلاس فلاتر
  factory ProfileModel.fromView(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['userid'],
      fullName: json['FullName'] ?? 'No Name',
      profilePicture: json['profile_picture'],
      bio: json['bio'],
      role: json['role'] ?? 'User',
      joinedAt: DateTime.parse(json['joined_at']),
      // يأخذ القيمة سواء كانت للمستثمر أو رائد الأعمال
      totalActivity: json['total_requests_sent'] ?? json['total_ideas'] ?? 0,
      activeChats: json['active_chats'] ?? 0,
    );
  }
}