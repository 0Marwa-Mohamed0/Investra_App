import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, AppColors.green1Color);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, AppColors.errorColor);
  }

  static void _show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
      ),
    );
  }
}
