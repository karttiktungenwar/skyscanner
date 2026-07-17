import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skyscanner/src/app/routes/app_route_names.dart';
import 'package:skyscanner/src/core/common/data/models/model_data.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/core/common/widgets/circle_icon_button.dart';
import 'package:skyscanner/src/core/common/widgets/rating_badge.dart';
import 'package:skyscanner/src/core/constants/theme.dart';
import 'package:skyscanner/src/features/detail/presentation/widgets/tour_card.dart';


/// Screen 2: destination detail (e.g. "Rio de Janeiro") with a full-bleed
/// hero image, description and a horizontally-scrolling "Upcoming tours"
/// list. Favorite state for both the destination and each tour is read
/// from/written to the shared [AppState].
class DestinationDetailScreen extends StatefulWidget {
  final Destination destination;

  const DestinationDetailScreen({
    super.key,
    required this.destination,
  });

  @override
  State<DestinationDetailScreen> createState() => _DestinationDetailScreenState();

}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  // For this demo every destination shares the same mock tour list;
  // in a real app this would be looked up by destination id.
  final tours = ModelData.toursForRio;
  /// Ids of destinations the user has favorite (heart icon toggled on).
  final ValueNotifier<Set<String>> favoriteDestinationIds =
  ValueNotifier<Set<String>>(<String>{});
  final ValueNotifier<bool> _isDescriptionExpanded = ValueNotifier<bool>(false);

  void toggleFavorite(String destinationId) {
    final updated = Set<String>.from(favoriteDestinationIds.value);
    if (!updated.remove(destinationId)) {
      updated.add(destinationId);
    }
    favoriteDestinationIds.value = updated;
  }

  @override
  void dispose() {
    favoriteDestinationIds.dispose();
    _isDescriptionExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body:  CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.destination.imageUrl,
                  height: 270,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Column(
                  children: [
                    const SizedBox(height: 250), // Overlap by 20dp (320 - 20)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.destination.city,
                                    style: AppText.sectionTitle
                                        .copyWith(fontSize: 24)),
                                RatingBadge(
                                  rating: widget.destination.rating,
                                  starColor: AppColors.ink,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.circle,
                                    size: 8, color: AppColors.badgeGreen),
                                const SizedBox(width: 6),
                                Text(widget.destination.country,
                                    style: AppText.subtitle),
                                const Spacer(),
                                Text(
                                  '${widget.destination.reviewCount} reviews',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.inkSoft,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 14),
                            ValueListenableBuilder<bool>(
                              valueListenable: _isDescriptionExpanded,
                              builder: (context, isExpanded, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.destination.description,
                                      style: AppText.body,
                                      maxLines: isExpanded ? null : 2,
                                      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Direct mutation triggers the listenable to notify consumers
                                          _isDescriptionExpanded.value = !isExpanded;
                                        },
                                        child: Text(
                                          isExpanded ? 'Read less' : 'Read more',
                                          style: AppText.linkBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Upcoming tours',
                                    style: AppText.sectionTitle),
                                Text('See all', style: AppText.linkBold),
                              ],
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              height: 270,
                              child: ValueListenableBuilder<Set<String>>(
                                valueListenable: favoriteDestinationIds,
                                builder: (context, favorites, _) {
                                  return ListView.separated(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: tours.length,
                                    separatorBuilder: (_, _) => const SizedBox(width: 14),
                                    itemBuilder: (context, index) {
                                      final tour = tours[index];
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.background,
                                          borderRadius: BorderRadius.circular(16.0), // Adjust the radius size as needed
                                        ),
                                        child: TourCard(
                                          tour: tour,
                                          isFavorite: favorites.contains(tour.id),
                                          onFavoriteTap: () => toggleFavorite(tour.id),
                                          onTap: () {
                                            context.push(
                                              AppRouteNames.tour,
                                              extra: tour,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          onTap: () => context.pop(),
                        ),
                        ValueListenableBuilder<Set<String>>(
                          valueListenable: favoriteDestinationIds,
                          builder: (context, favorites, _) {
                            final isFav =
                                favorites.contains(widget.destination.id);
                            return CircleIconButton(
                              icon: isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              iconColor:
                                  isFav ? Colors.redAccent : AppColors.ink,
                              onTap: () =>
                                  toggleFavorite(widget.destination.id),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
