import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class buildSectionTitle extends StatelessWidget {
  const buildSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
