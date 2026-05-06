import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:investra/feature/setting/widget/build_Icon_Container.dart';

class buildSecurityTile extends StatelessWidget {
  const buildSecurityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.subtitleColor,
    this.trailing,
    this.onTap, // 1. أضفنا الـ onTap هنا
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Color? subtitleColor;
  final Widget? trailing;
  final VoidCallback? onTap; // 2. تعريف النوع كـ دالة

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 3. تغليف بـ InkWell لإضافة تأثير الضغط (Ripple Effect)
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // اختياري: إضافة shadow خفيف ليطابق الصورة
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            buildIconContainer(icon: icon),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      if (trailing != null) ...[
                        const SizedBox(width: 8),
                        trailing!, // عرض الـ trailing إذا وجد
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleColor ?? AppColors.grayColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.grayColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
