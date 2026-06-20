import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildIdeaCard extends StatelessWidget {
  final String title;
  final String description;
  final String aiScore;
  final String views;
  final String viewTrend;
  final int activeInquiries;

  const BuildIdeaCard({
    super.key,
    required this.title,
    required this.description,
    required this.aiScore,
    required this.views,
    required this.viewTrend,
    required this.activeInquiries,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary1Color),
      ),
      child: Row(
        children: [
          // العنوان والوصف
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(description,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.grayColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.visibility_outlined,
                        size: 13, color: AppColors.gray2Color),
                    const SizedBox(width: 4),
                    Text('$views views',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray2Color)),
                    const SizedBox(width: 12),
                    const Icon(Icons.chat_bubble_outline,
                        size: 13, color: AppColors.gray2Color),
                    const SizedBox(width: 4),
                    Text('$activeInquiries inquiries',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray2Color)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // AI Score badge
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.lightgreen,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(Icons.bolt, size: 13, color: AppColors.green1Color),
                Text('$aiScore',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green1Color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}