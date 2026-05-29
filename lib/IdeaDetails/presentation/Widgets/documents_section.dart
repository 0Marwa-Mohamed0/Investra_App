import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class DocumentsSection extends StatelessWidget {
  final List<dynamic> docs;

  const DocumentsSection({super.key, required this.docs});

  @override
  Widget build(BuildContext context) {
    if (docs.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Required Documents",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // عرض قائمة الملفات
        ...docs.map((docUrl) {
          // منطق بسيط لتمييز نوع الملف من الرابط
          String label = docUrl.toString().contains('bp_')
              ? "Business Plan prepared"
              : "Financials prepared";

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.secondary1Color.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.primaryColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 15, color: AppColors.blackColor),
                  ),
                ),
                const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}