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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary1Color),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor),
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(description,
                        style: const TextStyle(fontSize: 13, color: AppColors.grayColor),
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.lightgreen, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(Icons.bolt, size: 14, color: AppColors.green1Color),
                    Text('$aiScore AI Score',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.green1Color)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.secondary2Color),
          const SizedBox(height: 16),
          Row(
            children: [
              _stat('TOTAL VIEWS', views, viewTrend, true),
              _stat('INVESTOR INQUIRIES', '$activeInquiries Active', '', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, String val, String trend, bool isTrend) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: AppColors.gray2Color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(val, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blackColor)),
              if (isTrend) ...[
                const SizedBox(width: 4),
                Text(trend, style: const TextStyle(fontSize: 12, color: AppColors.green1Color, fontWeight: FontWeight.bold)),
              ]
            ],
          ),
        ],
      ),
    );
  }
}