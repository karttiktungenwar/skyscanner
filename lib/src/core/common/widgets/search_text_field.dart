import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/common/widgets/circle_icon_button.dart';
import 'package:skyscanner/src/core/constants/theme.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSuffixPressed;
  final TextEditingController? controller;

  const SearchTextField({
    super.key,
    this.hintText = 'Search',
    this.prefixIcon = Icons.search,
    this.suffixIcon,
    this.onChanged,
    this.onSuffixPressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Calculate the ideal style matching your AppText layout
    const textStyle = TextStyle(
      fontSize: 16,
      color: AppColors.ink,
    );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: textStyle,
      // 2. Center alignment forces the structural alignment to lock perfectly
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle.copyWith(color: AppColors.inkSoft),

        // 3. Align alignment vectors via dynamic Prefix/Suffix wrappers
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.inkSoft, size: 22)
            : null,
        suffixIcon: _buildSuffixIcon(),

        // 4. Move the outer capsule style entirely into the Input Decorator
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24), // Matches your 24px capsule shape
          borderSide: BorderSide.none,
        ),

        // 5. Explicitly structure content constraints to zero out text offsets
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (suffixIcon == null) return null;

    // 6. Use padding to properly fit the icon within the 48px boundary lines
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleIconButton(
        icon: suffixIcon!,
        background: AppColors.inkSoft,
        onTap: (){},
      ),
    );
  }
}