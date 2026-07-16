import 'package:flutter/material.dart';

/// Small round white button used for back/favorite/close icons that sit
/// on top of photos throughout the app.
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? background;
  final VoidCallback onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
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
        decoration: BoxDecoration(color: background ?? Colors.white, shape: BoxShape.circle),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
