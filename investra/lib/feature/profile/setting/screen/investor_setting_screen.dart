import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investra App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.bgColor,
        fontFamily: 'Roboto',
      ),
      home: const AccountProfilePage(),
    );
  }
}

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({Key? key}) : super(key: key);

  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 1,
        title: const Text(
          'Investra',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: AppColors.grayColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.grayColor,
            ),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=Mirna+Omar&background=0D8ABC&color=fff',
              ), // صورة تجريبية
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // عنوان الصفحة
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Manage your private bank profile',
                style: TextStyle(fontSize: 15, color: AppColors.grayColor),
              ),
              const SizedBox(height: 32),

              // كارت الملف الشخصي
              _buildProfileCard(),
              const SizedBox(height: 32),

              // قسم الحماية (Security)
              _buildSectionHeader(Icons.security, ' Security'),
              const SizedBox(height: 14),
              _buildSecurityItem(
                icon: Icons.vpn_key_outlined,
                title: 'Password',
                subtitle: 'Last updated 14 days ago',
              ),
              const SizedBox(height: 12),
              _buildSecurityItem(
                icon: Icons.verified_user_outlined,
                title: 'Two-Factor Auth',
                subtitle: 'Enabled via Authenticator',
                isSubtitleGreen: true,
                iconColor: AppColors.green4Color,
              ),
              const SizedBox(height: 32),

              // قسم إدارة الحساب (Account Management)
              _buildSectionHeader(
                Icons.settings_outlined,
                'Account Management',
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.black87,
                      ),
                      title: const Text(
                        'Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Switch(
                        value: notificationsEnabled,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            notificationsEnabled = value;
                          });
                        },
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.black12,
                      indent: 16,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.color_lens_outlined,
                        color: Colors.black87,
                      ),
                      title: const Text(
                        'Appearance',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Text(
                        'System Default',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // زر تسجيل الخروج
              TextButton(
                onPressed: () {},
                child: const Text(
                  'SIGN OUT',
                  style: TextStyle(
                    color: Color(0xFFD32F2F),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت كارت الملف الشخصي
  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 80,
                  height: 80,
                  color: const Color(0xFF1E212A), // لون خلفية الصورة في التصميم
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                  // لاستخدام صورة حقيقية استبدل الكود السابق بـ:
                  // Image.asset('assets/avatar.png', fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0F3A7A),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.edit, size: 14, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'mirna omar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3A7A), // لون أزرق غامق
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'vance.investments@private.com',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.submissionColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'ELITE TIER MEMBER',
              style: TextStyle(
                color: AppColors.darkgreen, // أخضر غامق
                fontWeight: FontWeight.bold,
                fontSize: 11,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت لعناوين الأقسام (Security, Account Management)
  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 22),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  // ويدجت لعناصر قسم الحماية
  Widget _buildSecurityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isSubtitleGreen = false,
    Color iconColor = AppColors.blackColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.bgGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isSubtitleGreen ? AppColors.green4Color : AppColors.bgGray,
            fontSize: 12,
            fontWeight: isSubtitleGreen ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: AppColors.bgGray,
        ),
        onTap: () {},
      ),
    );
  }
}
