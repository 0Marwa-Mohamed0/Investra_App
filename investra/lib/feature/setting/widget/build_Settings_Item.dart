// import 'package:flutter/material.dart';
// import 'package:investra/core/styles/colors.dart';

// class buildSettingsItem extends StatelessWidget {
//   const buildSettingsItem({
//     super.key,
//     required this.icon, // ✅ تم تغيير النوع لـ Widget
//     required this.title,
//     required this.subtitle,
//     this.subtitleColor,
//   });

//   final Widget icon; // ✅ تغيير النوع هنا لـ Widget
//   final String title;
//   final String subtitle;
//   final Color? subtitleColor;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: AppColors.bgColor,
//       margin: const EdgeInsets.only(bottom: 8),
//       child: ListTile(
//         leading: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: AppColors.bgGray,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           // ✅ نضع الـ icon مباشرة هنا بدون تغليفه بـ Icon()
//           child: icon,
//         ),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
//         subtitle: Text(
//           subtitle,
//           style: TextStyle(
//             color: subtitleColor ?? AppColors.gray2Color,
//             fontSize: 12,
//           ),
//         ),
//         trailing: const Icon(Icons.chevron_right, color: AppColors.gray2Color),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';

class buildSettingsItem extends StatelessWidget {
  const buildSettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.subtitleColor,
    this.onTap, // 1. إضافة الـ onTap هنا
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Color? subtitleColor;
  final VoidCallback? onTap; // 2. تعريف المتغير من نوع VoidCallback

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.bgColor,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap, // 3. ربط المتغير بخاصية الضغط في ListTile
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.bgGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: subtitleColor ?? AppColors.gray2Color,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.gray2Color),
      ),
    );
  }
}
