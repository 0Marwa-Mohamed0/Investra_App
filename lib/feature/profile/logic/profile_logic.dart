import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/profile_model.dart';

class ProfileLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<ProfileModel?> fetchUserProfile(String userId) async {
    try {
      final investorResponse = await _supabase
          .from('investor_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (investorResponse != null) {
        debugPrint('Fetched from Investor Profile');
        return ProfileModel.fromView(investorResponse, 'Investor');
      }

      final entrepreneurResponse = await _supabase
          .from('entrepreneur_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (entrepreneurResponse != null) {
        debugPrint(' Fetched from Entrepreneur Profile');
        return ProfileModel.fromView(entrepreneurResponse, 'Entrepreneur');
      }

      return null;
    } catch (e) {
      debugPrint('Error fetching profile data: $e');
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
        debugPrint('💡 Ideas count from view for $userId: ${ideasList.length}');
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
          .select('idea_docs')
          .eq('entrepreneur_id', userId);

      int totalDocs = 0;

      if (response != null && response.isNotEmpty) {
        for (var row in response) {
          if (row['idea_docs'] != null && row['idea_docs'] is List) {
            final List docsList = row['idea_docs'] as List;
            // التصليح هنا: نجمع طول المصفوفة لكل فكرة داخل الـ totalDocs
            totalDocs += docsList.length;
          }
        }
      }

      debugPrint('REAL DOCS COUNT FROM idea_docs ARRAY: $totalDocs');
      return totalDocs;
    } catch (e) {
      debugPrint('Error counting entrepreneur docs from array: $e');
      return 0;
    }
  }

  // zero
  Future<int> getInvestorInvestmentsCount(String userId) async {
    try {
      return 0;
    } catch (_) {
      return 0;
    }
  }

  //final
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