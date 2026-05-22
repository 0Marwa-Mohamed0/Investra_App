import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class ProfileModel {
  final String userId;
  final String fullName;
  final String? profilePicture;
  final String? bio;
  final String role;
  final int totalActivity;
  final int activeChats;

  ProfileModel({
    required this.userId,
    required this.fullName,
    this.profilePicture,
    this.bio,
    required this.role,
    required this.totalActivity,
    required this.activeChats,
  });

  // تم حل مشكلة الـ 2 positional arguments بجعل الدور اختياري وذكي في الفحص
  factory ProfileModel.fromView(Map<String, dynamic> json, [String? userRole]) {
    // لو الـ role مش مبعوت، بنفحص المفاتيح اللي راجعة من السيرفر تلقائياً
    final String actualRole = userRole ??
        (json.containsKey('FullName') || json.containsKey('total_requests_sent') ? 'Investor' : 'Entrepreneur');

    if (actualRole.toLowerCase() == 'investor') {
      return ProfileModel(
        userId: json['userid'] ?? '',
        fullName: json['FullName'] ?? 'Investor',
        profilePicture: json['profile_picture'],
        bio: json['bio'] ?? '',
        role: 'Investor',
        totalActivity: json['total_requests_sent'] ?? 0,
        activeChats: json['active_chats'] ?? 0,
      );
    } else {
      return ProfileModel(
        userId: json['userid'] ?? '',
        fullName: json['name'] ?? 'Entrepreneur',
        profilePicture: json['profile picture'],
        bio: json['bio'] ?? '',
        role: 'Entrepreneur',
        totalActivity: json['numberofideas'] ?? 0,
        activeChats: 0,
      );
    }
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json, [String? userRole]) {
    return ProfileModel.fromView(json, userRole);
  }
}