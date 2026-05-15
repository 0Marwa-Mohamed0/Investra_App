import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';

class CategoryImageHeader extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBack;

  const CategoryImageHeader({super.key, required this.imagePath, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: CircleAvatar(
            backgroundColor: AppColors.bgColor, // استخدمنا الأبيض من ملفك
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor), // اللون الأساسي
              onPressed: onBack,
            ),
          ),
        ),
      ],
    );
  }
}