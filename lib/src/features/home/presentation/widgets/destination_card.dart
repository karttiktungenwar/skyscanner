import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/constants/theme.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/core/common/widgets/rating_badge.dart';

import '../../../../core/common/widgets/circle_icon_button.dart';


/// The big hero card on the Home screen showing a destination image,
/// its rating, a favorite heart toggle and a "See more" pill button.
class DestinationCard extends StatelessWidget {
  final Destination destination;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onSeeMoreTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onSeeMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: SizedBox(
        height: 340,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(destination.imageUrl, fit: BoxFit.cover),
            // Gradient so the white text stays readable over the photo.
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.55),
                  ],
                  stops: const [0.4, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: CircleIconButton(
                icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                iconColor: isFavorite ? Colors.redAccent : AppColors.ink,
                onTap: onFavoriteTap,
                background: AppColors.transparent,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destination.country,
                      style: const TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(destination.city, style: AppText.cardTitle),
                  const SizedBox(height: 8),
                  RatingBadge(
                    rating: destination.rating,
                    reviewCount: destination.reviewCount,
                    textColor: Colors.white,
                    starColor: AppColors.star,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: SizedBox(
                height: 44,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.transparent, // Customize your container background color
                    borderRadius: BorderRadius.circular(12), // Adjust corner roundedness
                    border: Border.all(
                      color: AppColors.surface, // Optional border
                      width: 1,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: onSeeMoreTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Text(
                      'See more',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
