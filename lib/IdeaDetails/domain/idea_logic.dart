import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/constants/app_images.dart';

class IdeaLogic {
  final _supabase = Supabase.instance.client;

  // جلب اسم رائد الأعمال من جدول User بناءً على userid (UUID)
  Future<String> getEntrepreneurName(String? userId) async {
    if (userId == null || userId.isEmpty) return 'Unknown User';
    try {
      final data = await _supabase
          .from('User')
          .select('FullName')
          .eq('userid', userId)
          .maybeSingle();

      return data?['FullName'] ?? 'Unknown User';
    } catch (e) {
      print("Error fetching name: $e");
      return 'Unknown User';
    }
  }

  // تحديد صورة القسم بناءً على التصنيف
  String getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'technology': return AppImages.technology_idea;
      case 'finance': return AppImages.finance;
      case 'healthcare': return AppImages.medCare;
      case 'ai': return AppImages.robotIdeaAi;
      default: return AppImages.technology_idea;
    }
  }

  // إرسال الطلب وإضافة الإشعار مع الـ IDs الصحيحة
  Future<void> submitAction({
    required String ideaId,
    required String entrepreneurId,
    required String ideaTitle,
    required bool isChatRequest,
  }) async {
    final myId = _supabase.auth.currentUser?.id;
    if (myId == null) throw Exception("Please login first");

    try {
      // 1. إضافة الطلب في جدول الـ requests وجلب بيانات السطر المضاف فوراً
      // نستخدم .select().single() لكي نحصل على الـ id الخاص بالطلب الجديد
      final requestResponse = await _supabase.from('requests').insert({
        'idea_id': ideaId,
        'sender_id': myId,
        'receiver_id': entrepreneurId,
        'content': isChatRequest ? 'Chat Request for: $ideaTitle' : 'Investment Interest',
        'status': 'pending',
      }).select().single();

      // الحصول على الـ ID الذي تم إنشاؤه للطلب
      final String newRequestId = requestResponse['id'];

      // 2. إضافة الإشعار في جدول الـ notifications مع تمرير المعرفات المطلوبة
      // نمرر idea_id و request_id لكي يتمكن زر Accept من العمل لاحقاً
      await _supabase.from('notifications').insert({
        'user_id': entrepreneurId,
        'title': isChatRequest ? 'New Chat Request' : 'Investment Interest',
        'content': 'An investor is interested in your project: $ideaTitle',
        'type': isChatRequest ? 'chat' : 'invest',
        'is_read': false,
        'idea_id': ideaId,       // تم إضافة هذا الحقل
        'request_id': newRequestId, // تم إضافة هذا الحقل
      });

      print("Success: Request and Notification sent with IDs (Request ID: $newRequestId)");
    } catch (e) {
      print("Submit Error Details: $e");
      rethrow;
    }
  }
}