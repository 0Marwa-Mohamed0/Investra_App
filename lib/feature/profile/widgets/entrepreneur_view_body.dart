import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import '../data/profile_model.dart';
import '../logic/profile_logic.dart';

class EntrepreneurViewBody extends StatefulWidget {
  final ProfileModel profile;
  final ProfileLogic logic;

  const EntrepreneurViewBody({super.key, required this.profile, required this.logic});

  @override
  State<EntrepreneurViewBody> createState() => _EntrepreneurViewBodyState();
}

class _EntrepreneurViewBodyState extends State<EntrepreneurViewBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _docsCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadDocsCount();
  }

  Future<void> _loadDocsCount() async {
    final count = await widget.logic.getEntrepreneurDocsCount(widget.profile.userId);
    if (mounted) {
      setState(() {
        _docsCount = count;
      });
    }
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
                future: widget.logic.getEntrepreneurIdeas(widget.profile.userId),
                builder: (context, snapshot) {
                  final ideasCount = snapshot.data?.length ?? 0;
                  return _buildStatCard(ideasCount.toString(), 'Ideas');
                },
              ),
              _buildStatCard('0', 'contracts'),
              _buildStatCard(_docsCount.toString(), 'Docs'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.grayColor,
          indicatorColor: AppColors.primaryColor,
          indicatorWeight: 2.5,
          tabs: const [
            Tab(text: 'Ideas'),
            Tab(text: 'Entrepreneur Details'),
          ],
        ),
        Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: _tabController,
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
                future: widget.logic.getEntrepreneurIdeas(widget.profile.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No ideas pitched yet.', style: TextStyle(color: AppColors.grayColor)));
                  }
                  final ideas = snapshot.data!;
                  return ListView.builder(
                    itemCount: ideas.length,
                    itemBuilder: (context, index) {
                      final idea = ideas[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.bgGray),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.lightbulb_outline, color: AppColors.primaryColor),
                          title: Text(idea['title'] ?? 'No Title', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackColor)),
                          subtitle: Text(idea['description'] ?? 'No Description', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.grayColor)),
                        ),
                      );
                    },
                  );
                },
              ),
              const Center(child: Text('No details provided yet.', style: TextStyle(color: AppColors.grayColor))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.grayColor)),
        ],
      ),
    );
  }
}