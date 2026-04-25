import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/profile/setting/widget/build_Profile_Card.dart';
import 'package:investra/feature/profile/setting/widget/build_Progress_Card.dart';
import 'package:investra/feature/profile/setting/widget/build_Section_Title.dart';
import 'package:investra/feature/profile/setting/widget/build_Settings_Item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          'The Editorial Wealth \n Experience',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline, color: AppColors.primaryColor),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Manage your private bank profile and investment preferences.',
              style: TextStyle(color: AppColors.darkGray),
            ),
            const SizedBox(height: 24),

            // --- Profile Card ---
            BuildProfileCard(),
            const SizedBox(height: 16),

            // --- Idea Submission Limit Card ---
            buildProgressCard(),
            const SizedBox(height: 20),

            // --- Security Section ---
            buildSectionTitle(title: 'SECURITY & ACCESS'),
            buildSettingsItem(
              icon: Icons.lock_outline,
              title: 'Change Password',
              subtitle: 'Last updated 3 months ago',
            ),
            buildSettingsItem(
              icon: Icons.verified_user_outlined,
              title: 'Two-Factor Authentication',
              subtitle: 'Enabled',
              subtitleColor: AppColors.green4Color,
            ),
            const SizedBox(height: 15),

            // --- Preferences Section ---
            buildSectionTitle(title: 'PREFERENCES'),
            _buildSettingsToggle(
              icon: Icons.notifications_active_outlined,
              title: 'Push Notifications',
              subtitle: 'Investment alerts & updates',
              value: true,
            ),
            _buildSettingsToggle(
              icon: Icons.email_outlined,
              title: 'Email Digests',
              subtitle: 'Weekly wealth summaries',
              value: false,
            ),

            const SizedBox(height: 25),

            // --- Sign Out Button ---
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: AppColors.errorColor),
                label: const Text(
                  'Sign Out from All Devices',
                  style: TextStyle(color: AppColors.errorColor),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.bgColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSettingsToggle({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool value,
}) {
  return Card(
    elevation: 0,
    color: AppColors.bgColor,
    margin: const EdgeInsets.only(bottom: 8),
    child: ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.bgGray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.grayColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.gray2Color, fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: (v) {},
      ),
    ),
  );
}
