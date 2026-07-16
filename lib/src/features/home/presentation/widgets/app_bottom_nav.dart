import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/constants/theme.dart';

/// Floating pill-shaped bottom navigation with 4 icons, matching the
/// dark rounded bar in the design. Purely visual - selection state is
/// owned by the parent via [selectedIndex]/[onSelected].
class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  static const _icons = [
    Icons.home_rounded,
    Icons.menu_rounded,
    Icons.favorite_border_rounded,
    Icons.grid_view_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.pillDark,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_icons.length, (index) {
          final selected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(index),
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[index],
                size: 22,
                color: selected ? AppColors.ink : Colors.white70,
              ),
            ),
          );
        }),
      ),
    );
  }
}
