import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';

class ActionButtonsSection extends StatelessWidget {
  final bool isLoading;
  final Future<void> Function(bool isChat) onAction;

  const ActionButtonsSection({super.key, required this.isLoading, required this.onAction});

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));

    return Column(
      children: [
        _buildButton(
          label: "Request Chat",
          isPrimary: true,
          onPressed: () => onAction(true),
        ),
        const SizedBox(height: 12),
        _buildButton(
          label: "Invest",
          isPrimary: false,
          onPressed: () => onAction(false),
        ),
      ],
    );
  }

  Widget _buildButton({required String label, required bool isPrimary, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primaryColor : AppColors.bgColor, // تطبيق الألوان
          side: isPrimary ? BorderSide.none : const BorderSide(color: AppColors.primaryColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isPrimary ? AppColors.bgColor : AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}