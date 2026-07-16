import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/constants/theme.dart';


/// A single rounded filter chip used in the "Select your next trip" row.
/// Purely presentational - the parent decides what "selected" means and
/// what happens on tap, so this widget stays reusable.
class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.chipSelected : AppColors.chipUnselected,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : AppColors.ink,
          ),
        ),
      ),
    );
  }
}
