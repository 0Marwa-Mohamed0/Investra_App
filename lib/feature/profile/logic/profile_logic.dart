import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/profile_model.dart';

class ProfileLogic {
  final _supabase = Supabase.instance.client;

  // جلب بروفايل المستثمر (باستخدام الـ View اللي عملناه)
  Future<ProfileModel> getInvestorProfile(String userId) async {
    try {
      final response = await _supabase
          .from('investor_full_profile')
          .select()
          .eq('userid', userId)
          .single();

      return ProfileModel.fromView(response);
    } catch (e) {
      throw Exception('فشل في تحميل بيانات المستثمر: $e');
    }
  }

  // جلب بروفايل رائد الأعمال
  Future<ProfileModel> getEntrepreneurProfile(String userId) async {
    try {
      final response = await _supabase
          .from('profile')
          .select('''
            userid, "FullName", profile_picture, bio,
            User(role, createdat)
          ''')
          .eq('userid', userId)
          .single();

      return ProfileModel.fromView(response);
    } catch (e) {
      throw Exception('فشل في تحميل بيانات رائد الأعمال: $e');
    }
  }
}