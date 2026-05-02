import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/home_page/widget/build_Filters.dart';
import 'package:investra/feature/home_page/widget/build_PostCard.dart';
import 'package:investra/feature/home_page/widget/build_Search_Bar.dart';

class InvestorHomePage extends StatelessWidget {
  final ScrollController scrollController;

  const InvestorHomePage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: AppColors.secondary2Color,
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
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.notificationSvg,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // 1. التأكد من ربط الـ controller
          controller: scrollController,

          // 2. تصحيح الـ physics لضمان إرسال الإشعارات بسلاسة
          // استخدمي AlwaysScrollableScrollPhysics لضمان عمل التمرير حتى لو المحتوى قصير
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(), // تعطيكِ شعور مرن أثناء التمرير
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildSearchBar(),
                const SizedBox(height: 14),
                const BuildFilters(),
                const SizedBox(height: 22),
                const Text(
                  'Investment Opportunities',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 18),
                const BuildPostcard(
                  category: 'TECHNOLOGY',
                  title: 'Bridging idea with investments',
                  description:
                      'Investra is a smart mobile application that connects entrepreneurs with investors.',
                  members: '+12',
                ),
                const SizedBox(height: 16),
                const BuildPostcard(
                  category: 'FINTECH',
                  title: 'ZenLedger AI',
                  description:
                      'Automated micro-investing platform that uses AI to analyze spending habits.',
                  members: '+8',
                ),
                const SizedBox(height: 16),
                const BuildPostcard(
                  category: 'HEALTHTECH',
                  title: 'NeuroSync Wearable',
                  description:
                      'Next-gen EEG headband that provides real-time biofeedback.',
                  members: '+15',
                ),
                // 3. مساحة إضافية مهمة جداً لضمان القدرة على التمرير واختفاء الشريط
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
