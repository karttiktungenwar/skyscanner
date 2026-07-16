import 'package:flutter/material.dart';
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
    return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixPressed,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, // Transparent border
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    ),
    );
  }
}