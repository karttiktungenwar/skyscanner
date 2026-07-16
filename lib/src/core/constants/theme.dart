import 'package:flutter/material.dart';

/// Central place for the design tokens used across TripGlide.
/// Keeping colors/text styles here means every screen/widget stays visually
/// consistent without repeating literal values everywhere.
class AppColors {
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color ink = Color(0xFF141414);
  static const Color inkSoft = Color(0xFF6B6B6B);
  static const Color chipUnselected = Color(0xFFEFEFEF);
  static const Color chipSelected = Color(0xFF141414);
  static const Color pillDark = Color(0xFF1A1A1A);
  static const Color divider = Color(0xFFE7E7E7);
  static const Color star = Color(0xFFF5F5F5);
  static const Color badgeGreen = Color(0xFF3DBE6C);
  static const Color transparent = Colors.transparent;
}

class AppText {
  static const TextStyle greeting = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    color: AppColors.inkSoft,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    height: 1.4,
    color: AppColors.inkSoft,
  );
  static const TextStyle linkBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );
}
