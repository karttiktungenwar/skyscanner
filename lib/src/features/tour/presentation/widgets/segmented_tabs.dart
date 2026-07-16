import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/constants/theme.dart';

/// Horizontal pill tab bar, e.g. "Tour schedule | Accommodation | Booking
/// details". Selection is owned by the parent so it can be driven by a
/// ValueNotifier.
class SegmentedTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SegmentedTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.chipSelected : AppColors.chipUnselected,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : AppColors.ink,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
