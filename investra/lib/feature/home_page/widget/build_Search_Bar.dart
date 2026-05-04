import 'package:flutter/material.dart';
import 'package:investra/core/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search.svg',
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(AppColors.gray2Color, BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          const Text(
            'Search startup ideas...',
            style: TextStyle(
              color: AppColors.gray2Color,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
