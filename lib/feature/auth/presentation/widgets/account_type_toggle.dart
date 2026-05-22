import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class AccountTypeToggle extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const AccountTypeToggle({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.secondary1Color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: _buildToggleBtn("Investor")),
          Expanded(child: _buildToggleBtn("Entrepreneur")),
        ],
      ),
    );
  }

  Widget _buildToggleBtn(String type) {
    final bool isActive = selectedType == type;
    return GestureDetector(
      onTap: () => onTypeChanged(type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? AppColors.bgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isActive ? [BoxShadow(color: AppColors.blackColor.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))] : null,
        ),
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? AppColors.primaryColor : AppColors.grayColor,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}