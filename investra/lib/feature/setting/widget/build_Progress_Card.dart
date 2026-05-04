import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';

class buildProgressCard extends StatelessWidget {
  const buildProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryColor],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Idea Submission Limit',
                style: TextStyle(color: AppColors.bgColor, fontSize: 17),
              ),

              SvgPicture.asset(
                AppImages.idea2Svg,
                colorFilter: const ColorFilter.mode(
                  AppColors.bgGray,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '1',
                style: TextStyle(
                  color: AppColors.bgColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' / 2 ideas used',
                style: TextStyle(color: AppColors.bgGray, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: 0.5,
            backgroundColor: AppColors.darkGray,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.submissionColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
