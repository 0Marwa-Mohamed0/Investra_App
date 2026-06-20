import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class AiInvestorRatingCard extends StatelessWidget {
  final double rating;

  const AiInvestorRatingCard({
    super.key,
    this.rating = 0,
  });

  String _getPotentialLabel(double r) {
    if (r >= 4) return "High Potential";
    if (r >= 2.5) return "Medium Potential";
    return "Low Potential";
  }

  Color _getPotentialColor(double r) {
    if (r >= 4) return AppColors.darkgreen;
    if (r >= 2.5) return Colors.orange;
    return Colors.red;
  }

  Widget _buildStars() {
    return Row(
      children: List.generate(5, (i) {
        IconData icon;
        if (rating >= i + 1) {
          icon = Icons.star;
        } else if (rating >= i + 0.5) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, color: Colors.amber, size: 18);
      }),
    );
  }

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "AI INVESTOR RATING",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkgreen),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _buildStars(),
                    const SizedBox(width: 6),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.grayColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _getPotentialColor(rating),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.trending_up, color: Colors.white, size: 14),
                const SizedBox(width: 4),
                Text(
                  _getPotentialLabel(rating),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}