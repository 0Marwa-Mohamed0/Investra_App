import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/profile_service.dart';

class InvestorViewBody extends StatefulWidget {
  final ProfileModel profile;

  const InvestorViewBody({super.key, required this.profile});

  @override
  State<InvestorViewBody> createState() => _InvestorViewBodyState();
}

class _InvestorViewBodyState extends State<InvestorViewBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProfileService _logic = ProfileService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. قسم الإحصائيات (INVESTMENTS & CHATS)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder<int>(
                future: _logic.getInvestorInvestmentsCount(widget.profile.userId),
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 0;
                  return _buildStatCard(count.toString(), 'INVESTMENTS');
                },
              ),
              FutureBuilder<int>(
                future: _logic.getInvestorChatsCount(widget.profile.userId),
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 0;
                  return _buildStatCard(count.toString(), 'CHATS');
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // 2. الـ TabBar عشان يفصل بين القوائم زي الفيجما ورائد الأعمال
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.grayColor,
          indicatorColor: AppColors.primaryColor,
          indicatorWeight: 2.5,
          tabs: const [
            Tab(text: 'Investments'),
            Tab(text: 'Investor Details'),
          ],
        ),

        Container(
          height: 250, // مساحة مريحة للـ Empty State والـ Scrolling لاحقاً
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: _tabController,
            children: [

              FutureBuilder<List<Map<String, dynamic>>>(
                future: _logic.getInvestorInvestments(widget.profile.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.primaryColor),
                    );
                  }

                  final investments = snapshot.data ?? [];
                  if (investments.isEmpty) {
                    return const Center(
                      child: Text(
                        'No active investments to show.',
                        style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: investments.length,
                    itemBuilder: (context, index) {
                      final inv = investments[index];
                      final bool isFunded = inv['status'] == 'funded';

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.bgGray),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.trending_up, color: AppColors.primaryColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    inv['title'] ?? 'Untitled',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  Text(
                                    inv['description'] ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grayColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isFunded
                                    ? AppColors.green1Color.withOpacity(0.15)
                                    : AppColors.secondary1Color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                isFunded ? 'Funded' : 'Pending',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isFunded ? AppColors.green1Color : AppColors.grayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              const Center(
                child: Text(
                  'No details provided yet.',
                  style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bgGray),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.grayColor, letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }
}