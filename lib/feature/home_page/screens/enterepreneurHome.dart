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
    final userId = supabase.auth.currentUser?.id ?? '';

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
          child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: supabase.from('ideas').stream(primaryKey: ['id']).eq('entrepreneur_id', userId),
              builder: (context, snapshot) {
                final ideasList = snapshot.data ?? [];
                final int count = ideasList.length;
                final bool reachedLimit = count >= 2;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(userId),
                    const SizedBox(height: 24),
                    BuildSubmissionCard(
                        currentCount: count,
                        maxLimit: 2,
                        remainingSlots: (2 - count).clamp(0, 2)
                    ),
                    const SizedBox(height: 32),
                    const BuildSectionHeader(title: 'Your Active Ideas', action: ''),
                    const SizedBox(height: 12),
                    _buildIdeaSection(ideasList),
                    const SizedBox(height: 16),
                    reachedLimit ? _buildLimitReachedMessage() : const BuildSubmitButton(),
                    const SizedBox(height: 32),
                    const BuildSectionHeader(title: 'Recent Chat Requests', action: ''),
                    const SizedBox(height: 12),
                    _buildChatRequestsStream(supabase, userId),
                    const SizedBox(height: 80),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String userId) {
    return FutureBuilder<String>(
      future: getUserName(userId),
      builder: (context, nameSnapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back, ${nameSnapshot.data ?? '...'}!',
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.blackColor)),
            const Text('Ready to scale your next big thing?',
                style: TextStyle(fontSize: 14, color: AppColors.gray2Color)),
          ],
        );
      },
    );
  }

  Widget _buildChatRequestsStream(SupabaseClient supabase, String userId) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('requests').stream(primaryKey: ['id']).eq('receiver_id', userId),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildEmptyState("No requests found.");
        }

        final pendingChatRequests = snapshot.data!.where((req) {
          final isPending = req['status'] == 'pending';
          final content = (req['content'] ?? '').toString().toLowerCase();
          final isInvestment = content.contains('investment') || content.contains('invest') || req['type'] == 'invest';

          return isPending && !isInvestment;
        }).take(3).toList();

        if (pendingChatRequests.isEmpty) {
          return _buildEmptyState("No pending chat requests.");
        }

        return Column(
          children: pendingChatRequests.map((req) {
            final String requestId = req['id'].toString();
            final String investorId = req['sender_id'] ?? '';
            final String? ideaId = req['idea_id']?.toString();

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BuildChatRequest(
                name: 'Investor Inquiry',
                company: req['content'] ?? 'Interested in your idea',
                icon: Icons.chat_bubble_outline,
                onAcceptTap: () => _processAccept(supabase, requestId, userId, investorId, ideaId, context),
                onDeclineTap: () => _processDecline(supabase, requestId, context),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> _processAccept(SupabaseClient supabase, String requestId, String userId, String investorId, String? ideaId, BuildContext context) async {
    try {
      await supabase.from('requests').update({'status': 'accepted'}).eq('id', requestId);

      if (ideaId != null) {
        final existingChat = await supabase
            .from('chat')
            .select('chat_id')
            .eq('entrepreneur_id', userId)
            .eq('investor_id', investorId)
            .eq('idea_id', ideaId)
            .maybeSingle();

        if (existingChat == null) {
          await supabase.from('chat').insert({
            'entrepreneur_id': userId,
            'investor_id': investorId,
            'idea_id': ideaId,
          });
        }

        await supabase.from('notifications').insert({
          'user_id': investorId,
          'title': 'Request Accepted! 🎉',
          'content': 'Your request has been accepted. You can start chatting now!',
          'type': 'chat_accepted',
          'is_read': false,
          'idea_id': ideaId,
          'request_id': requestId,
        });
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Chat created! Connection established.")));
      }
    } catch (e) {
      debugPrint("Error accepting request: $e");
    }
  }

  Future<void> _processDecline(SupabaseClient supabase, String requestId, BuildContext context) async {
    try {
      await supabase.from('requests').update({'status': 'declined'}).eq('id', requestId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Request declined.")));
      }
    } catch (e) {
      debugPrint("Error declining request: $e");
    }
  }

  Widget _buildIdeaSection(List<Map<String, dynamic>> ideasList) {
    if (ideasList.isEmpty) return _buildEmptyState("No ideas posted yet.");
    ideasList.sort((a, b) => b['created_at'].compareTo(a['created_at']));

    return Column(
      children: ideasList.map((idea) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: BuildIdeaCard(
          title: idea['title'] ?? 'Untitled',
          description: idea['description'] ?? 'No Description',
          aiScore: idea['ai_rating']?.toString() ?? '0.0',
          views: idea['views']?.toString() ?? '0',
          viewTrend: idea['trend']?.toString() ?? '+0%',
          activeInquiries: idea['inquiries_count'] ?? 0,
        ),
      )).toList(),
    );
  }

  Widget _buildNotificationIcon(SupabaseClient supabase, String userId) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('notifications').stream(primaryKey: ['id']).eq('user_id', userId),
      builder: (context, snapshot) {
        bool hasUnread = snapshot.data?.any((n) => !n['is_read']) ?? false;
        return IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
          icon: Stack(
            children: [
              SvgPicture.asset(AppImages.notificationSvg,
                  colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
              if (hasUnread)
                Positioned(right: 0, top: 0, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle))),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLimitReachedMessage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.bgColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.secondary1Color)),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.primaryColor),
          SizedBox(width: 12),
          Expanded(child: Text("Limit reached (2/2 ideas).", style: TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w500))),
        ],
      ),
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