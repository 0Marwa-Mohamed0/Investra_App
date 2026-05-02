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
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Color? subtitleColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
                    if (trailing != null) ...[const SizedBox(width: 8)],
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grayColor),
        ],
      ),
    );
  }
}
