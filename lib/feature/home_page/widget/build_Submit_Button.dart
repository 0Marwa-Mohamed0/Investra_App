import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class BuildSubmitButton extends StatelessWidget {
  const BuildSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: const Center(
        child: Text(
          '⊕ Submit New Idea',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}