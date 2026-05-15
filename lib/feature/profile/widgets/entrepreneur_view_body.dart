import 'package:flutter/material.dart';
import '../data/profile_model.dart';
import 'user_ideas_list.dart'; // تأكدي من وجود هذا الملف لعرض القائمة

class EntrepreneurViewBody extends StatelessWidget {
  final ProfileModel profile;
  const EntrepreneurViewBody({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard('Posted Ideas', profile.totalActivity.toString()),
              _buildStatCard('Active Chats', profile.activeChats.toString()),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'My Pitched Ideas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // هذا الويدجت يفترض أنه موجود عندك لعرض قائمة الأفكار
          const UserIdeasList(),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}