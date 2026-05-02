import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildPostcard extends StatelessWidget {
  const BuildPostcard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.members,
  });

  final String category;
  final String title;
  final String description;
  final String members;

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 14, color: AppColors.yellowColor),
                  Icon(Icons.star, size: 14, color: AppColors.yellowColor),
                  Icon(Icons.star, size: 14, color: AppColors.yellowColor),
                  Icon(Icons.star, size: 14, color: AppColors.yellowColor),
                  Icon(Icons.star_border, size: 14, color: AppColors.yellowColor),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.gray2Color,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 10),
                  const SizedBox(width: 4),
                  const CircleAvatar(radius: 10),
                  const SizedBox(width: 6),
                  Text(
                    members,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGray,
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w600,
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
