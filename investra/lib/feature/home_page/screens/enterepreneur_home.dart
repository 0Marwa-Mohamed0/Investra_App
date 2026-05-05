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

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          ' Investra',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: supabase.from('notifications').stream(primaryKey: ['id']),
            builder: (context, snapshot) {
              // فلترة الإشعارات غير المقروءة للمستخدم الحالي داخل الـ builder
              final unread = snapshot.data?.where((n) =>
              n['user_id'] == userId && n['is_read'] == false
              ).toList() ?? [];

              bool hasUnread = unread.isNotEmpty;

              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                      );
                    },
                    icon: SvgPicture.asset(
                      AppImages.notificationSvg,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  if (hasUnread)
                    Positioned(
                      right: 12,
                      top: 12,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back, Alex!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Ready to scale your next big thing?',
                  style: TextStyle(fontSize: 14, color: AppColors.gray2Color),
                ),
                const SizedBox(height: 16),
                const BuildSubmissionCard(),
                const SizedBox(height: 22),
                const BuildSectionHeader(
                  title: 'Your Active Ideas',
                  action: 'View All',
                ),
                const SizedBox(height: 12),
                const BuildIdeaCard(),
                const SizedBox(height: 16),
                const BuildSubmitButton(),
                const SizedBox(height: 22),
                const BuildSectionHeader(
                  title: 'Recent Chat Requests',
                  action: '',
                ),
                const SizedBox(height: 12),
                const BuildChatRequest(
                  name: 'Sarah Jenkins',
                  company: 'Blue Horizon Ventures',
                  icon: Icons.lightbulb_outline,
                ),
                const SizedBox(height: 12),
                const BuildChatRequest(
                  name: 'Marcus Thorne',
                  company: 'Apex Capital',
                  icon: Icons.sailing,
                ),
                const SizedBox(height: 12),
                const BuildChatRequest(
                  name: 'Emma Collins',
                  company: 'Future Seed Partners',
                  icon: Icons.trending_up,
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}