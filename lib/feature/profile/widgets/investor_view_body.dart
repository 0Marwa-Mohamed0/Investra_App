import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../data/profile_model.dart';
import '../logic/profile_logic.dart';

class InvestorViewBody extends StatefulWidget {
  final ProfileModel profile;

  const InvestorViewBody({super.key, required this.profile});

  @override
  State<InvestorViewBody> createState() => _InvestorViewBodyState();
}

class _InvestorViewBodyState extends State<InvestorViewBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProfileLogic _logic = ProfileLogic();

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

        // 3. الـ TabBarView لعرض المحتوى أو الـ Empty State داخل كل Tab
        Container(
          height: 250, // مساحة مريحة للـ Empty State والـ Scrolling لاحقاً
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: _tabController,
            children: [
              // الـ Tab الأول: Investments (بيعرض حالياً الـ Empty State بشكل منظم)
              const Center(
                child: Text(
                  'No active investments to show.',
                  style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // الـ Tab الثاني: Investor Details
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