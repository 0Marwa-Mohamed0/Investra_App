import 'dart:io'; // مهم للتعامل مع الملفات
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart'; // تأكدي من إضافة المكتبة في pubspec.yaml
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/auth/presentation/login_screen.dart';
import 'package:investra/feature/help/screen/help_screen.dart';
import 'package:investra/feature/notification/view/notifications_screen.dart';
import 'package:investra/feature/setting/widget/build_Profile_Card.dart';
import 'package:investra/feature/setting/widget/build_Progress_Card.dart';
import 'package:investra/feature/setting/widget/build_Section_Title.dart';
import 'package:investra/feature/setting/widget/build_Settings_Item.dart';
import 'package:investra/feature/setting/widget/build_setting_toggle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  final ScrollController scrollController;

  const SettingsScreen({super.key, required this.scrollController});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? _pickedImage;

  final String defaultImageUrl =
      'https://i.pinimg.com/736x/a4/be/2d/a4be2d9b169649eae96098785afad294.jpg';

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _pickedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint("خطأ في اختيار الصورة: $e");
    }
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

  // دالة لتنفيذ تسجيل الخروج (تحتاج لتعديل حسب المنطق الخاص بك)
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
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            controller: widget.scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Manage your private bank profile and investment preferences.',
                    style: TextStyle(color: AppColors.darkGray, fontSize: 14),
                  ),
                  const SizedBox(height: 24),

                  // Profile Card
                  BuildProfileCard(
                    name: 'Esraa Alaa',
                    onEditProfile: _pickImage,
                    imageFile: _pickedImage,
                    imageUrl: defaultImageUrl,
                  ),
                  const SizedBox(height: 16),

                  buildProgressCard(),
                  const SizedBox(height: 20),
                  buildSectionTitle(title: 'SECURITY & ACCESS'),

                  buildSettingsItem(
                    icon: _buildItemSvg(AppImages.lockSvg),
                    title: 'Password',
                    subtitle: 'Update your login credentials',
                    onTap: () {
                      // الكود الخاص بفتح صفحة الـ ChangePasswordScreen هنا
                    },
                  ),
                  buildSettingsItem(
                    icon: _buildItemSvg(AppImages.securitySvg),
                    title: 'Two-Step Verification',
                    subtitle: 'Extra layer of security',
                  ),

                  const SizedBox(height: 10),
                  buildSectionTitle(title: 'PREFERENCES'),

                  CustomSettingsToggle(
                    icon: _buildItemSvg(AppImages.notification2Svg),
                    title: 'Push Notifications',
                    subtitle: 'Investment alerts & updates',
                    value: true,
                    onChanged: (v) {},
                  ),

                  const SizedBox(height: 25),
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
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.errorColor,
                      ),
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
        ),
      ),
    );
  }

  // --- دوال مساعدة لتقليل تكرار الكود ---

  Widget _buildItemSvg(String path) {
    return SvgPicture.asset(
      path,
      height: 24,
      width: 24,
      colorFilter: const ColorFilter.mode(
        AppColors.primaryColor,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildProfileImage({double size = 90, bool showEditIcon = false}) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size * 0.22),
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
                ),
        ),
      ],
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
