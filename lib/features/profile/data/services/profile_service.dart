import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/profile_model.dart';

class ProfileService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<ProfileModel?> fetchUserProfile(String userId) async {
    try {
      final investorResponse = await _supabase
          .from('investor_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (investorResponse != null) {
        return ProfileModel.fromView(investorResponse, 'Investor');
      }

      final entrepreneurResponse = await _supabase
          .from('entrepreneur_full_profile')
          .select()
          .eq('userid', userId)
          .maybeSingle();

      if (entrepreneurResponse != null) {
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
            totalDocs += docsList.length;
          }
        }
      }
      return totalDocs;
    } catch (e) {
      debugPrint('Error counting entrepreneur docs from array: $e');
      return 0;
    }
  }

  Future<int> getInvestorInvestmentsCount(String userId) async {
    return 0;
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
