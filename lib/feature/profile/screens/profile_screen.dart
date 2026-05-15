import 'package:flutter/material.dart';
import '../logic/profile_logic.dart';
import '../data/profile_model.dart';
import '../widgets/profile_header.dart';
import '../widgets/investor_view_body.dart';
import '../widgets/entrepreneur_view_body.dart';

class ProfileScreen extends StatelessWidget {
  final String userId;
  final String role; // نمرر الـ role لنعرف أي دالة نستدعي

  const ProfileScreen({super.key, required this.userId, required this.role});

  @override
  Widget build(BuildContext context) {
    final logic = ProfileLogic();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: FutureBuilder<ProfileModel>(
        future: role == 'Investor'
            ? logic.getInvestorProfile(userId)
            : logic.getEntrepreneurProfile(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final profile = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(profile: profile),
                if (profile.role == 'Investor')
                  InvestorViewBody(profile: profile)
                else
                  EntrepreneurViewBody(profile: profile),
              ],
            ),
          );
        },
      ),
    );
  }
}