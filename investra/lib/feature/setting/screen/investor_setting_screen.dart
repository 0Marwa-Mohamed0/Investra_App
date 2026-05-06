import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:investra/core/constants/app_images.dart';

import 'package:investra/core/styles/colors.dart';

import 'package:investra/feature/auth/presentation/login_screen.dart';
import 'package:investra/feature/help/screen/help_screen.dart';
import 'package:investra/feature/notification/view/notifications_screen.dart';
import 'package:investra/feature/setting/screen/change_password.dart';

import 'package:investra/feature/setting/widget/build_Icon_Container.dart';

import 'package:investra/feature/setting/widget/build_Security_Tile.dart';

class AccountScreen extends StatefulWidget {
  final ScrollController scrollController;

  const AccountScreen({super.key, required this.scrollController});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final String userName = "Esraa Alaa";
  final String userEmail = "ea8940011@gmail.com";
  final String userRole = "Entrepreneur";
  final String userBio = "Building the next big thing in tech.";
  bool isNotificationEnabled = true;
  File? _pickedImage;
  final String defaultImageUrl =
      'https://i.pinimg.com/736x/a4/be/2d/a4be2d9b169649eae96098785afad294.jpg';

  // --- دالة اختيار الصورة ---
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // يمكنك استخدام image_cropper لاقتصاص الصورة هنا قبل حفظها
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  // --- Widget صورة البروفايل ---
  Widget _buildProfileImage({double size = 90, bool showEditIcon = false}) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            size * 0.22,
          ), // نسبة وتناسب للحواف الدائرية
          child: _pickedImage != null
              ? Image.file(
                  _pickedImage!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  defaultImageUrl,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: size,
                      height: size,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, color: Colors.grey),
                    );
                  },
                ),
        ),
        if (showEditIcon)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.bgColor, width: 2),
            ),
            child: const Icon(Icons.edit, color: AppColors.bgColor, size: 12),
          ),
      ],
    );
  }

  void _showProfileImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            InteractiveViewer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _pickedImage != null
                    ? Image.file(_pickedImage!, fit: BoxFit.contain)
                    : Image.network(defaultImageUrl, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: AppColors.bg,
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
          _buildAppBarIcon(
            AppImages.notificationSvg,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            ),
            size: 30,
          ),
          _buildAppBarIcon(
            AppImages.helpSvg,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HelpSupportScreen(),
              ),
            ),
            size: 22,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => _showProfileImage(context),
            child: _buildProfileImage(size: 36),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Manage your $userRole profile",
                      style: const TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // --- جعل الصورة والأيقونة قابلة للضغط ---
                    GestureDetector(
                      onTap: _pickImage, // استدعاء دالة اختيار الصورة
                      child: _buildProfileImage(size: 90, showEditIcon: true),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userEmail,
                      style: const TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      userBio,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: userRole == "Entrepreneur"
                            ? AppColors.submissionColor
                            : AppColors.grayColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        userRole.toUpperCase(),
                        style: TextStyle(
                          color: userRole == "Entrepreneur"
                              ? AppColors.darkgreen
                              : AppColors.darkGray,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              const Row(
                children: [
                  Icon(Icons.security, color: AppColors.primaryColor, size: 26),
                  SizedBox(width: 10),
                  Text(
                    "Security",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildSecurityTile(
                icon: SvgPicture.asset(AppImages.passwordSvg),
                title: "Password",
                subtitle: "Update your login credentials",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 35),
              const Row(
                children: [
                  Icon(Icons.settings, color: AppColors.primaryColor, size: 25),
                  SizedBox(width: 10),
                  Text(
                    "Account Management",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: buildIconContainer(
                    icon: SvgPicture.asset(
                      AppImages.notification2Svg,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Switch(
                    value: isNotificationEnabled,
                    onChanged: (val) =>
                        setState(() => isNotificationEnabled = val),
                    activeTrackColor: AppColors.darkgreen,
                    activeThumbColor: AppColors.bgColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColors.bg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text(
                          "Sign Out",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          "Are you sure you want to sign out?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _performLogout(context);
                            },
                            child: const Text(
                              "Sign Out",
                              style: TextStyle(
                                color: AppColors.errorColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout, color: AppColors.errorColor),
                  label: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: AppColors.errorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarIcon(
    String iconPath,
    VoidCallback onTap, {
    double size = 24,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        iconPath,
        height: size,
        width: size,
        colorFilter: const ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
