import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/home_page/widget/build_ChatRequest.dart';
import 'package:investra/feature/home_page/widget/build_IdeaCard.dart';
import 'package:investra/feature/home_page/widget/build_Section_Header.dart';
import 'package:investra/feature/home_page/widget/build_Submission_Card.dart';
import 'package:investra/feature/home_page/widget/build_Submit_Button.dart';
import 'package:investra/feature/notification/view/notifications_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EntrepreneurHomePage extends StatelessWidget {
  final ScrollController? scrollController;

  const EntrepreneurHomePage({super.key, this.scrollController});

  Future<int> getTotalSubmissionCount(String userId) async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('ideas').select('id').eq('entrepreneur_id', userId);
      return (response as List).length;
    } catch (e) {
      return 0;
    }
  }

  Future<String> getUserName(String userId) async {
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase.from('User').select('FullName').eq('userid', userId).maybeSingle();
      return data?['FullName']?.toString() ?? 'Entrepreneur';
    } catch (e) {
      return 'User';
    }
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id??'';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(' Investra',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 26, fontWeight: FontWeight.bold)),
        actions: [
          _buildNotificationIcon(supabase, userId),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<String>(
                future: getUserName(userId),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back, ${snapshot.data ?? '...'}!',
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.blackColor)),
                      const Text('Ready to scale your next big thing?',
                          style: TextStyle(fontSize: 14, color: AppColors.gray2Color)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),

              FutureBuilder<int>(
                future: getTotalSubmissionCount(userId),
                builder: (context, snapshot) {
                  final int count = snapshot.data ?? 0;
                  return BuildSubmissionCard(currentCount: count, maxLimit: 2, remainingSlots: (2 - count).clamp(0, 2));
                },
              ),
              const SizedBox(height: 32),

              const BuildSectionHeader(title: 'Your Active Ideas', action: 'View All'),
              const SizedBox(height: 12),
              _buildIdeaSection(supabase, userId),

              const SizedBox(height: 16),
              const BuildSubmitButton(),
              const SizedBox(height: 32),

              const BuildSectionHeader(title: 'Recent Chat Requests', action: ''),
              const SizedBox(height: 12),
              _buildChatRequestsStream(supabase, userId),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdeaSection(SupabaseClient supabase, String userId) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: supabase.from('ideas').select('*').eq('entrepreneur_id', userId).order('created_at', ascending: false).limit(1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildEmptyState("No ideas posted yet.");
        }

        final idea = snapshot.data!.first;

        return BuildIdeaCard(
          title: idea['title'] ?? 'Untitled',
          description: idea['description'] ?? 'No Description',
          aiScore: idea['ai_rating']?.toString() ?? '0.0',
          views: idea['views']?.toString() ?? '0',
          viewTrend: idea['trend']?.toString() ?? '+0%',
          activeInquiries: idea['inquiries_count'] ?? 0,
        );
      },
    );
  }


  Widget _buildNotificationIcon(SupabaseClient supabase, String userId) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('notifications').stream(primaryKey: ['id']),
      builder: (context, snapshot) {
        bool hasUnread = snapshot.data?.any((n) => n['user_id'] == userId && !n['is_read']) ?? false;
        return IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
          icon: Stack(
            children: [
              SvgPicture.asset(AppImages.notificationSvg, colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
              if (hasUnread) Positioned(right: 0, top: 0, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle))),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChatRequestsStream(SupabaseClient supabase, String userId) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('requests').stream(primaryKey: ['id']).eq('receiver_id', userId).limit(3),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) return const Center(child: Text("No chat requests yet.", style: TextStyle(color: Colors.grey)));
        return Column(
          children: snapshot.data!.map((req) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BuildChatRequest(name: 'Investor Inquiry', company: req['content'] ?? '', icon: Icons.chat_bubble_outline),
          )).toList(),
        );
      },
    );
  }

  Widget _buildEmptyState(String msg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.secondary1Color)),
      child: Center(child: Text(msg, style: const TextStyle(color: AppColors.grayColor))),
    );
  }
}