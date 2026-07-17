import 'package:cached_network_image/cached_network_image.dart';
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
            CachedNetworkImage(placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover, imageUrl: destination.imageUrl,
            ),
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
                border: Border.all(
                  color: AppColors.surface,
                  width: 1,
                ),
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
                    color: AppColors.transparent,// Customize your container background color
                    borderRadius: BorderRadius.circular(25), // Adjust corner roundedness
                    border: Border.all(
                      color: AppColors.surface, // Optional border
                      width: 1,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: onSeeMoreTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // 1. A spacer matching the width of your icon button
                        // to keep the text perfectly centered in the Row.
                        const SizedBox(width: 40), // Adjust this width to match your CircleIconButton size

                        // 2. Centered Text that fills the remaining space
                        const Expanded(
                          child: Text(
                            'See more',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // 3. Icon at the end
                        CircleIconButton(
                          icon: Icons.arrow_forward_ios_rounded,
                          onTap: onSeeMoreTap,
                          iconColor: AppColors.surface,
                          background: AppColors.ink,
                        ),
                      ],
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
