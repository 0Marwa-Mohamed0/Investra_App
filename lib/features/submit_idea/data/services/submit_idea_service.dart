import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class SubmitIdeaService {
  final SupabaseClient _supabase = Supabase.instance.client;

  static const String _aiBaseUrl = 'https://investraapp-production.up.railway.app';

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

      String? bpUrl;
      String? fsUrl;

      // 1. رفع خطة العمل (Business Plan)
      if (businessPlanFile != null) {
        String fileName = 'bp_${DateTime.now().millisecondsSinceEpoch}.pdf';
        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', businessPlanFile);
        bpUrl = _supabase.storage
            .from('ideas_docs')
            .getPublicUrl('public/$fileName');
      }

      // 2. رفع دراسة الجدوى (Feasibility Study)
      if (feasibilityFile != null) {
        String fileName = 'fs_${DateTime.now().millisecondsSinceEpoch}.pdf';
        await _supabase.storage
            .from('ideas_docs')
            .upload('public/$fileName', feasibilityFile);
        fsUrl = _supabase.storage
            .from('ideas_docs')
            .getPublicUrl('public/$fileName');
      }

      // 3. إدراج البيانات في جدول 'ideas' واسترجاع الـ id الجديد
      final inserted = await _supabase
          .from('ideas')
          .insert({
        'title': title,
        'description': description,
        'category': category,
        'entrepreneur_id': userId,
        'business_plan_url': bpUrl,
        'feasibility_study_url': fsUrl,
        'status': 'pending',
      })
          .select('id')
          .single();

      final ideaId = inserted['id'].toString();

      // 4. إطلاق طلب التقييم بالـ AI من غير ما نوقف نجاح الـ submit عليه
      final fileToEvaluate = businessPlanFile ?? feasibilityFile;
      if (fileToEvaluate != null) {
        _triggerAiEvaluation(
          ideaId: ideaId,
          userId: userId,
          file: fileToEvaluate,
        );
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<void> _triggerAiEvaluation({
    required String ideaId,
    required String userId,
    required File file,
  }) async {
    try {
      final uri = Uri.parse('$_aiBaseUrl/evaluate');
      final request = http.MultipartRequest('POST', uri)
        ..fields['idea_id'] = ideaId
        ..fields['user_id'] = userId
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      final streamedResponse = await request.send();
      if (streamedResponse.statusCode != 200) {
        // ignore: avoid_print
        print('AI evaluation failed with status ${streamedResponse.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('AI evaluation request error: $e');
    }
  }
}