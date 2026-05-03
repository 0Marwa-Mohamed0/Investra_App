import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class buildIconContainer extends StatelessWidget {
  const buildIconContainer({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    // قمت بتغيير النوع هنا من IconData لـ Widget
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: icon, // الآن سيعمل مع SvgPicture أو Icon بشكل طبيعي
    );
  }
}
