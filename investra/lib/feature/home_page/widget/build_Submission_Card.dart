import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSubmissionCard extends StatelessWidget {
  // تعريف المتغيرات المطلوبة لجعل الكارت ديناميكي
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
    // حساب قيمة البروجرس بار (نسبة مئوية بين 0.0 و 1.0)
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$currentCount / $maxLimit', // عرض الأرقام الحقيقية هنا
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
              value: progressValue, // القيمة المحسوبة ديناميكياً
              minHeight: 8,
              backgroundColor: const Color(0xFFD6DCE5),
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryColor),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$remainingSlots slots remaining for your account', // نص ديناميكي
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.gray2Color,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // هنا ممكن تضيفي نافذة تخبر اليوزر أن الترقية قادمة قريباً
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Upgrade feature coming soon!")),
                  );
                },
                child: const Text(
                  'Upgrade >',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
