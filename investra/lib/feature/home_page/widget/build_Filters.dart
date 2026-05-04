import 'package:flutter/material.dart';
import 'package:investra/feature/home_page/widget/filter_Button.dart';

class BuildFilters extends StatelessWidget {
  const BuildFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: FilterButton(text: 'Popularity', selected: true)),
        const SizedBox(width: 8),
        const Expanded(
          child: FilterButton(text: 'Categories', selected: false),
        ),
        const SizedBox(width: 8),
        const Expanded(child: FilterButton(text: 'AI Rating', selected: false)),
      ],
    );
  }
}
