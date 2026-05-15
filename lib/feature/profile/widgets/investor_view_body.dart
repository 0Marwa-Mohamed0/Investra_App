import 'package:flutter/material.dart';
import '../data/profile_model.dart';

class InvestorViewBody extends StatelessWidget {
  final ProfileModel profile;
  const InvestorViewBody({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard('Requests Sent', profile.totalActivity.toString()),
          _buildStatCard('Active Chats', profile.activeChats.toString()),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label),
          ],
        ),
      ),
    );
  }
}