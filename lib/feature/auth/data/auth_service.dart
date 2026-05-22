import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // تسجيل الدخول العادي بالبريد وكلمة السر
  Future<AuthResponse> login(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // تحديث الجلسة وجلب الـ Role إن وجد
  Future<String> updateUserSessionAndGetRole(String userId) async {
    await _supabase
        .from('User')
        .update({'last_login': DateTime.now().toIso8601String()})
        .eq('userid', userId);

    Map<String, dynamic>? data;
    for (int i = 0; i < 2; i++) {
      data = await _supabase
          .from('User')
          .select('role')
          .eq('userid', userId)
          .maybeSingle();
      if (data != null) break;
      await Future.delayed(const Duration(seconds: 1));
    }

    if (data == null) {
      throw 'User record not found in database.';
    }

    return data['role'] ?? 'Unknown';
  }

  // فحص هل المستخدم له سجل في جدول User أم أنه مستخدم جوجل جديد
  Future<Map<String, dynamic>?> checkUserRecord(String userId) async {
    return await _supabase
        .from('User')
        .select()
        .eq('userid', userId)
        .maybeSingle();
  }

  // إنشاء أو تحديث سجل للمستخدم الجديد القادم من جوجل (تعديل للـ upsert)
  Future<void> createUserRecord({
    required String userId,
    required String email,
    required String name,
    required String role,
  }) async {
    await _supabase.from('User').upsert({
      'userid': userId,
      'FullName': name,
      'email': email,
      'role': role,
      'createdat': DateTime.now().toIso8601String(),
    });
  }

  // التسجيل العادي
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': name,
        'user_type': role,
      },
    );
  }

  Future<void> signInWithOAuth(OAuthProvider provider) async {
    await _supabase.auth.signInWithOAuth(
      provider,
      redirectTo: 'io.supabase.flutter://login-callback',
    );
  }

  Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(
      email,
      redirectTo: 'io.supabase.flutter://login-callback',
    );
  }
}