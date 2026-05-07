import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investra/core/styles/colors.dart';

// --- ويدجت الزر (FilterButton) ---
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
          children: [
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
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
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

// --- ويدجت تجميع الفلاتر (BuildFilters) مع تنسيق القائمة ---
class BuildFilters extends StatelessWidget {
  final String selectedCategory;
  final double selectedRating;
  final Function(String) onCategoryChanged;
  final Function(double) onRatingChanged;

  const BuildFilters({
    super.key,
    required this.selectedCategory,
    required this.selectedRating,
    required this.onCategoryChanged,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // فلتر الأقسام
        Expanded(
          child: PopupMenuButton<String>(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: AppColors.bgColor, // خلفية القائمة
            offset: const Offset(0, 50), // تظهر أسفل الزر قليلاً
            onSelected: onCategoryChanged,
            itemBuilder: (context) => ['All', 'Technology', 'Business', 'Healthtech', 'AI']
                .map((cat) => PopupMenuItem(
              value: cat,
              child: Text(
                cat,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ))
                .toList(),
            child: FilterButton(
              text: selectedCategory == 'All' ? 'Categories' : selectedCategory,
              selected: selectedCategory != 'All',
            ),
          ),
        ),
        const SizedBox(width: 10),
        // فلتر التقييم
        Expanded(
          child: PopupMenuButton<double>(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: AppColors.bgColor,
            offset: const Offset(0, 50),
            onSelected: onRatingChanged,
            itemBuilder: (context) => [0.0, 3.0, 4.0, 4.5]
                .map((rate) => PopupMenuItem(
              value: rate,
              child: Text(
                rate == 0.0 ? 'All Ratings' : '$rate+ Stars',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ))
                .toList(),
            child: FilterButton(
              text: selectedRating == 0.0 ? 'AI Rating' : '$selectedRating+',
              selected: selectedRating > 0,
            ),
          ),
        ),
      ],
    );
  }
}
