import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/constants/theme.dart';


/// Small star + rating number, optionally followed by a review count,
/// e.g. "★ 5.0   143 reviews". Used across the home card and detail screen.
class RatingBadge extends StatelessWidget {
  final double rating;
  final int? reviewCount;
  final Color textColor;
  final Color? starColor;

  const RatingBadge({
    super.key,
    required this.rating,
    this.reviewCount,
    this.textColor = AppColors.ink,
    this.starColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.transparent, // Customize your container background color
              borderRadius: BorderRadius.circular(12), // Adjust corner roundedness
              border: Border.all(
                color: starColor ?? AppColors.ink, // Optional border
                width: 1,
              ),
            ),
            child: Row(
    children: [
      Icon(Icons.star_outline_rounded, size: 16, color: starColor),
    const SizedBox(width: 4),
    Text(
    rating.toStringAsFixed(1),
    style: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: textColor,
    ),
    ),
    ],
    )

        ),
        if (reviewCount != null) ...[
          const SizedBox(width: 8),
          Text(
            '$reviewCount reviews',
            style: TextStyle(
              fontSize: 12,
              color: textColor.withValues(alpha: 0.7),
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ],
    );
  }
}
