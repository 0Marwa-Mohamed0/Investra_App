import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:investra/core/constants/app_images.dart';

class IdeaLogic {
  final _supabase = Supabase.instance.client;

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

  String getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'technology':
        return AppImages.technology_idea;
      case 'finance':
        return AppImages.finance;
      case 'healthcare':
        return AppImages.medCare;
      case 'ai':
        return AppImages.robotIdeaAi;
      default:
        return AppImages.technology_idea;
    }
  }

  Future<void> submitAction({
    required String ideaId,
    required String entrepreneurId,
    required String ideaTitle,
    required bool isChatRequest,
  }) async {
    final myId = _supabase.auth.currentUser?.id;
    if (myId == null) throw Exception("Please login first");

    try {
      final String requestContent = isChatRequest
          ? 'Chat Request for: $ideaTitle'
          : 'Investment Interest in: $ideaTitle';

      await _supabase.from('requests').insert({
        'idea_id': ideaId,
        'sender_id': myId,
        'receiver_id': entrepreneurId,
        'content': requestContent,
        'status': 'pending',
      });

      print("Success: Request sent. Supabase Trigger will handle the notification.");
    } catch (e) {
      print("Submit Error Details: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getIdeaById(String ideaId) async {
    try {
      return await _supabase
          .from('ideas')
          .select()
          .eq('id', ideaId)
          .maybeSingle();
    } catch (e) {
      print("Error fetching idea: $e");
      return null;
    }
  }


  Future<String?> getInvestorIdFromRequest(String requestId) async {
    try {
      final data = await _supabase
          .from('requests')
          .select('sender_id')
          .eq('id', requestId)
          .maybeSingle();
      return data?['sender_id']?.toString();
    } catch (e) {
      print("Error fetching investor id: $e");
      return null;
    }
  }
}