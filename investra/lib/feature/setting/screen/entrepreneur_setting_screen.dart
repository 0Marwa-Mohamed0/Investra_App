import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/setting/widget/build_Profile_Card.dart';
import 'package:investra/feature/setting/widget/build_Progress_Card.dart';
import 'package:investra/feature/setting/widget/build_Section_Title.dart';
import 'package:investra/feature/setting/widget/build_Settings_Item.dart';
import 'package:investra/feature/setting/widget/build_setting_toggle.dart';

class SettingsScreen extends StatelessWidget {
  final ScrollController scrollController;

  const SettingsScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          'The Editorial Wealth \n Experience',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.notificationSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.helpSvg,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/a4/be/2d/a4be2d9b169649eae96098785afad294.jpg',
              ),
            ),
          ),
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
            controller: scrollController,
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

                  // --- Profile Card ---
                  BuildProfileCard(),
                  const SizedBox(height: 16),

                  // --- Idea Submission Limit Card ---
                  buildProgressCard(),
                  const SizedBox(height: 20),

                  // --- Security Section ---
                  buildSectionTitle(title: 'SECURITY & ACCESS'),
                  buildSettingsItem(
                    icon: SvgPicture.asset(
                      AppImages.lockSvg,
                      height: 24,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: 'Email Digests',
                    subtitle: 'Weekly wealth summaries',
                  ),
                  buildSettingsItem(
                    icon: SvgPicture.asset(
                      AppImages.securitySvg,
                      height: 24,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: 'Email Digests',
                    subtitle: 'Weekly wealth summaries',
                  ),
                  const SizedBox(height: 10),
                  buildSectionTitle(title: 'PREFERENCES'),
                  // --- Preferences Section ---
                  CustomSettingsToggle(
                    icon: SvgPicture.asset(
                      AppImages.notification2Svg,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: 'Push Notifications',
                    subtitle: 'Investment alerts & updates',
                    value: true,
                    onChanged: (v) {},
                  ),

                  CustomSettingsToggle(
                    icon: SvgPicture.asset(
                      AppImages.messegeSvg,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: 'Email Digests',
                    subtitle: 'Weekly wealth summaries',
                    value: false,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: 25),
                  // --- Sign Out Button ---
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.errorColor,
                      ),
                      label: const Text(
                        'Sign Out from All Devices',
                        style: TextStyle(color: AppColors.errorColor),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
