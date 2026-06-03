import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubmitIdeaService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> submitIdea({
    required String title,
    required String description,
    required String category,
    required File? businessPlanFile,
    required File? feasibilityFile,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not logged in');

      List<String> uploadedUrls = [];

      // Upload Business Plan
      if (businessPlanFile != null) {
        String fileName = 'bp_${DateTime.now().millisecondsSinceEpoch}.pdf';
        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', businessPlanFile);
        uploadedUrls.add(
            _supabase.storage.from('ideas_docs').getPublicUrl('public/$fileName'));
      }

      // Upload Feasibility Study
      if (feasibilityFile != null) {
        String fileName = 'fs_${DateTime.now().millisecondsSinceEpoch}.pdf';
        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', feasibilityFile);
        uploadedUrls.add(
            _supabase.storage.from('ideas_docs').getPublicUrl('public/$fileName'));
      }

      // Insert data into 'ideas' table
      await _supabase.from('ideas').insert({
        'title': title,
        'description': description,
        'category': category,
        'entrepreneur_id': userId,
        'idea_docs': uploadedUrls,
        'status': 'pending',
      });
    } catch (e) {
      rethrow;
    }
  }
}
