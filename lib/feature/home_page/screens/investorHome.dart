import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/home_page/widget/build_Filters.dart';
import 'package:investra/feature/home_page/widget/build_PostCard.dart';
import 'package:investra/feature/notification/view/notifications_screen.dart';
import 'package:investra/IdeaDetails/presentation/Page/idea_details_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InvestorHomePage extends StatefulWidget {
  final ScrollController scrollController;
  const InvestorHomePage({super.key, required this.scrollController});

  @override
  State<InvestorHomePage> createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends State<InvestorHomePage> {
  String _categoryFilter = 'All';
  double _ratingFilter = 0.0;

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.secondary2Color,
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
              final unread = snapshot.data?.where((n) =>
              n['user_id'] == userId && n['is_read'] == false
              ).toList() ?? [];
              bool hasUnread = unread.isNotEmpty;

              return Stack(
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
                    icon: SvgPicture.asset(AppImages.notificationSvg, colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)),
                  ),
                  if (hasUnread)
                    Positioned(right: 12, top: 12, child: Container(width: 9, height: 9, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle))),
                ],
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildFilters(
                  selectedCategory: _categoryFilter,
                  selectedRating: _ratingFilter,
                  onCategoryChanged: (val) => setState(() => _categoryFilter = val),
                  onRatingChanged: (val) => setState(() => _ratingFilter = val),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Investment Opportunities',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primaryColor),
                ),
                const SizedBox(height: 18),
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: supabase.from('ideas').stream(primaryKey: ['id']).order('created_at'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());

                    var ideas = snapshot.data ?? [];

                    if (_categoryFilter != 'All') {
                      ideas = ideas.where((i) => (i['category']?.toString().toLowerCase() ?? '') == _categoryFilter.toLowerCase()).toList();
                    }

                    if (ideas.isEmpty) return const Center(child: Padding(padding: EdgeInsets.only(top: 40), child: Text("No ideas found.")));

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ideas.length,
                      itemBuilder: (context, index) {
                        final idea = ideas[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: BuildPostcard(
                            category: (idea['category'] ?? 'General').toString().toUpperCase(),
                            title: idea['title'] ?? 'No Title',
                            description: idea['description'] ?? '',
                            rating: (idea['ai_rating'] ?? 0).toDouble(),
                            onTap: () {
                              // الانتقال لصفحة التفاصيل وتمرير البيانات
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IdeaDetailsScreen(idea: idea),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
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