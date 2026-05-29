import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class buildIconContainer extends StatelessWidget {
  const buildIconContainer({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: icon,
    );
  }
}
