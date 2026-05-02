import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/core/styles/colors.dart';


class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.text,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryColor : AppColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E3E8)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.0,
                color: selected ? AppColors.bgColor : AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 6),
            SvgPicture.asset(
              'assets/icons/down.svg',
              height: 12,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.bgColor : AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
