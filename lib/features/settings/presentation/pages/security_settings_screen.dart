import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool is2FAEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary2Color,
      appBar: AppBar(
        title: const Text(
          "Security Settings",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSecurityOption(
            icon: Icons.phonelink_lock_rounded,
            title: "Two-Factor Authentication",
            subtitle: "Use an authenticator app for extra security",
            trailing: Switch.adaptive(
              value: is2FAEnabled,
              activeTrackColor: AppColors.green1Color,
              onChanged: (val) => setState(() => is2FAEnabled = val),
            ),
          ),
          const SizedBox(height: 16),
          _buildSecurityOption(
            icon: Icons.fingerprint_rounded,
            title: "Biometric Login",
            subtitle: "Use FaceID or Fingerprint to login",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.darkGray,
            ),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildSecurityOption(
            icon: Icons.devices_rounded,
            title: "Manage Devices",
            subtitle: "See where you are currently logged in",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.darkGray,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.secondary2Color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.darkGray),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
