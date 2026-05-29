import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class AiInvestorRatingCard extends StatelessWidget {
   final String ratingPercentage;

  const AiInvestorRatingCard({
    super.key,
    this.ratingPercentage = "92%",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.lightgreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.submissionColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.psychology, color: AppColors.darkgreen, size: 24),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AI Feasibility Rate",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkgreen,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Based on project criteria and markets",
                  style: TextStyle(fontSize: 11, color: AppColors.grayColor),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.darkgreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              ratingPercentage,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}