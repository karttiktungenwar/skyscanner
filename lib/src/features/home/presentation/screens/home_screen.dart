import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skyscanner/src/app/routes/app_route_names.dart';
import 'package:skyscanner/src/core/common/widgets/home_app_bar.dart';
import 'package:skyscanner/src/core/common/widgets/search_text_field.dart';
import 'package:skyscanner/src/core/common/data/models/model_data.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/features/home/presentation/widgets/app_bottom_nav.dart';
import 'package:skyscanner/src/features/home/presentation/widgets/category_chip.dart';
import 'package:skyscanner/src/features/home/presentation/widgets/destination_card.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Currently selected bottom-nav index on the Home screen.
  final ValueNotifier<int> bottomNavIndex = ValueNotifier<int>(0);
  /// Currently selected category chip on the Home screen.
  final ValueNotifier<String> selectedCategory =
  ValueNotifier<String>(ModelData.categories[2]); // 'South America'
  /// Ids of destinations the user has favorite (heart icon toggled on).
  final ValueNotifier<Set<String>> favoriteDestinationIds =
  ValueNotifier<Set<String>>(<String>{});

  void toggleFavorite(String destinationId) {
    final updated = Set<String>.from(favoriteDestinationIds.value);
    if (!updated.remove(destinationId)) {
      updated.add(destinationId);
    }
    favoriteDestinationIds.value = updated;
  }

  void openDetail(Destination destination) {
    // Navigate to the detail screen.
    context.push(
      AppRouteNames.detail,
      extra: destination,
    );
  }

  @override
  void dispose() {
    bottomNavIndex.dispose();
    selectedCategory.dispose();
    favoriteDestinationIds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          title: 'Hello, Kartik',
          subtitle: 'Welcome to TripGlide!',
          avatarUrl: 'https://karttiktungenwar.github.io/portfolio/assets/img/my-profile-img.png',
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              suffixIcon: Icons.filter_list_rounded,
            ),
            const SizedBox(height: 14),
            ValueListenableBuilder<String>(
              valueListenable: selectedCategory,
              builder: (context, selected, _) {
                return SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ModelData.categories.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final category = ModelData.categories[index];
                      return CategoryChip(
                        label: category,
                        selected: category == selected,
                        onTap: () => selectedCategory.value = category,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: ValueListenableBuilder<String>(
                  valueListenable: selectedCategory,
                  builder: (context, selectedCategory, _) {
                    // Filter destinations by selected category
                    final matches = ModelData.destinations
                        .where((d) => d.continent == selectedCategory)
                        .toList();

                    // Fallback to all destinations if no matches
                    final destinations = matches.isNotEmpty ? matches : ModelData.destinations;

                    return ValueListenableBuilder<Set<String>>(
                      valueListenable: favoriteDestinationIds,
                      builder: (context, favorites, _) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 300, // Adjust height as needed
                            viewportFraction: 0.8, // Width of each card relative to screen
                            enlargeCenterPage: true, // Center card is larger
                            enableInfiniteScroll: false,
                            padEnds: false,
                          ),
                          items: destinations.map((destination) {
                            return Builder(
                              builder: (BuildContext context) {
                                return DestinationCard(
                                  destination: destination,
                                  isFavorite: favorites.contains(destination.id),
                                  onFavoriteTap: () => toggleFavorite(destination.id),
                                  onSeeMoreTap: () => openDetail(destination),
                                );
                              },
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<int>(
              valueListenable: bottomNavIndex,
              builder: (context, index, _) {
                return AppBottomNav(
                  selectedIndex: index,
                  onSelected: (i) => bottomNavIndex.value = i,
                );
              },
            ),
            const SizedBox(height: 12),
        ],
      ),
    ),
    );
  }

}