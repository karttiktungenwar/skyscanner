import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/core/common/widgets/circle_icon_button.dart';
import 'package:skyscanner/src/core/common/widgets/rating_badge.dart';
import 'package:skyscanner/src/core/constants/theme.dart';


/// A single card in the horizontally-scrolling "Upcoming tours" list on
/// the Destination detail screen.
class TourCard extends StatelessWidget {
  final Tour tour;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  const TourCard({
    super.key,
    required this.tour,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(tour.imageUrl, fit: BoxFit.cover),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleIconButton(
                        icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                        iconColor: isFavorite ? Colors.redAccent : AppColors.ink,
                        onTap: onFavoriteTap,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tour.title, style: AppText.linkBold.copyWith(fontSize: 15)),
                    const SizedBox(height: 4),
                    Text(
                      '${tour.days} days  •  from \$${tour.priceFrom}/person',
                      style: AppText.subtitle,
                    ),
                    const SizedBox(height: 4),
                    RatingBadge(rating: tour.rating, reviewCount: tour.reviewCount,starColor: AppColors.ink,),
                  ],
                ),
                CircleIconButton(
                  icon: Icons.arrow_forward_rounded,
                  background: AppColors.pillDark,
                  iconColor: Colors.white,
                  onTap: onTap,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
