import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investra/core/constants/app_images.dart';
import 'package:investra/core/styles/colors.dart';

class BuildProgressCard extends StatelessWidget {
  final int usedIdeas;
  final int totalLimit;

  const BuildProgressCard({
    super.key,
    required this.usedIdeas,
    this.totalLimit = 2,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = (usedIdeas / totalLimit).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
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
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SvgPicture.asset(
                AppImages.idea2Svg,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$usedIdeas / $totalLimit ideas used',
            style: const TextStyle(color: Colors.white70, fontSize: 17),
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.submissionColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}