import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/constants/theme.dart';

/// Small round white button used for back/favorite/close icons that sit
/// on top of photos throughout the app.
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? background;
  final VoidCallback onTap;
  final Border? border;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.border,
    this.iconColor = Colors.black,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
            color: background ?? AppColors.surface,
            shape: BoxShape.circle,
            border: border ?? const Border.fromBorderSide(BorderSide.none),
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
