import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSubmissionCard extends StatelessWidget {
  final int currentCount;
  final int maxLimit;
  final int remainingSlots;

  const BuildSubmissionCard({
    super.key,
    required this.currentCount,
    required this.maxLimit,
    required this.remainingSlots,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = maxLimit > 0 ? (currentCount / maxLimit) : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Idea Submission Limit',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGray,
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$currentCount / $maxLimit',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 8,
              backgroundColor: const Color(0xFFD6DCE5),
              valueColor:
              const AlwaysStoppedAnimation(AppColors.primaryColor),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            '$remainingSlots slots remaining for your account',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.gray2Color,
            ),
          ),
        ],
      ),
    );
  }
}