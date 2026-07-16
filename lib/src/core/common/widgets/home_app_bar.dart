import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyscanner/src/core/constants/theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String? avatarUrl;
  final double? avatarRadius;
  final Widget? action;

  const HomeAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.avatarUrl,
    this.avatarRadius = 20,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppText.greeting,
          ),
          Text(
            subtitle,
            style: AppText.subtitle,
          ),
        ],
      ),
      actions: [
        if (avatarUrl != null)
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: NetworkImage(avatarUrl!),
          ),
        if (action != null) action!,
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}