import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/profile_model.dart';

class ProfileService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<ProfileModel?> fetchUserProfile(String userId) async {
    try {
      // ✅ الصورة والـ bio دايماً من جدول profile الموحّد، مهما كان نوع اليوزر
      // (Investor أو Entrepreneur) - هاد المصدر الوحيد للصورة بكل التطبيق
      final profileResponse = await _supabase
          .from('profile')
          .select('profile_picture, bio')
          .eq('userid', userId)
          .maybeSingle();

      // 🔍 Debug: شوفي بالـ console شو القيمة الراجعة فعلياً
      debugPrint('🔍 [profile table] userId=$userId -> response=$profileResponse');

      final String? unifiedPicture = profileResponse?['profile_picture'];
      final String? unifiedBio = profileResponse?['bio'];

      debugPrint('🔍 [profile table] unifiedPicture=$unifiedPicture');

      // نجرب الاستثمار أولاً
      final investorResponse = await _supabase
          .from('investor_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (investorResponse != null) {
        debugPrint('🔍 Found as Investor: $userId');
        return ProfileModel.fromView(investorResponse, 'Investor').copyWith(
          profilePicture: unifiedPicture,
          bio: unifiedBio,
        );
      }

      // وإلا نجرب رائد الأعمال
      final entrepreneurResponse = await _supabase
          .from('entrepreneur_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (entrepreneurResponse != null) {
        debugPrint('🔍 Found as Entrepreneur: $userId');
        return ProfileModel.fromView(entrepreneurResponse, 'Entrepreneur').copyWith(
          profilePicture: unifiedPicture,
          bio: unifiedBio,
        );
      }

      debugPrint('⚠️ No profile found at all for userId=$userId');
      return null;
    } catch (e) {
      debugPrint('❌ Error fetching profile data: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getEntrepreneurIdeas(String userId) async {
    try {
      final response = await _supabase
          .from('entrepreneur_full_profile')
          .select('idea_id, idea_title, idea_description, idea_status')
          .eq('userid', userId);

      if (response != null && response.isNotEmpty) {
        List<Map<String, dynamic>> ideasList = [];
        for (var row in response) {
          if (row['idea_id'] != null) {
            ideasList.add({
              'id': row['idea_id'],
              'title': row['idea_title'],
              'description': row['idea_description'],
              'status': row['idea_status'],
              'user_id': userId,
            });
          }
        }
        return ideasList;
      }
      return [];
    } catch (e) {
      debugPrint('Error fetching ideas from view: $e');
      return [];
    }
  }

  Future<int> getEntrepreneurDocsCount(String userId) async {
    try {
      final response = await _supabase
          .from('ideas')
          .select('business_plan_url, feasibility_study_url')
          .eq('entrepreneur_id', userId);

      int totalDocs = 0;

      if (response != null && response.isNotEmpty) {
        for (var row in response) {
          final businessPlan = row['business_plan_url'];
          final feasibilityStudy = row['feasibility_study_url'];

          if (businessPlan != null && (businessPlan as String).isNotEmpty) {
            totalDocs++;
          }
          if (feasibilityStudy != null && (feasibilityStudy as String).isNotEmpty) {
            totalDocs++;
          }
        }
      }
      return totalDocs;
    } catch (e) {
      debugPrint('Error counting entrepreneur docs: $e');
      return 0;
    }
  }

  Future<int> getInvestorInvestmentsCount(String userId) async {
    try {
      final response = await _supabase
          .from('investments')
          .select('id')
          .eq('investor_id', userId);
      return response.length;
    } catch (e) {
      debugPrint('Error counting investments: $e');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getInvestorInvestments(String userId) async {
    try {
      final response = await _supabase
          .from('investments')
          .select('id, idea_id, investment_date, ideas(title, description, status, ai_rating)')
          .eq('investor_id', userId);

      return response.map<Map<String, dynamic>>((row) {
        final idea = row['ideas'] as Map<String, dynamic>?;
        return {
          'investment_id': row['id'],
          'idea_id': row['idea_id'],
          'investment_date': row['investment_date'],
          'title': idea?['title'] ?? 'Untitled Idea',
          'description': idea?['description'] ?? '',
          'status': idea?['status'] ?? 'pending',
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching investor investments: $e');
      return [];
    }
  }

  Future<int> getInvestorChatsCount(String userId) async {
    try {
      final response = await _supabase
          .from('chat')
          .select('chat_id')
          .eq('investor_id', userId);
      return response.length;
    } catch (e) {
      debugPrint(' Error counting investor live chats: $e');
      return 0;
    }
  }
}