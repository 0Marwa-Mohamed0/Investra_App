import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildPostcard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final double rating;
  final VoidCallback? onTap; // ده اللي هينفذ الانتقال للصفحة التانية

  const BuildPostcard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.rating,
    this.onTap,
  });

  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(Icon(
        i <= rating ? Icons.star : (i - rating < 1 ? Icons.star_half : Icons.star_border),
        size: 14,
        color: AppColors.yellowColor,
      ));
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondary2Color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primaryColor),
                ),
              ),
              _buildRatingStars(rating),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.darkGray)),
          const SizedBox(height: 8),
          Text(description, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: AppColors.gray2Color)),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: onTap, // هنا بنشغل الـ onTap اللي باعتينه من الهوم
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('View Details', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          )
        ],
      ),
    );
  }
}