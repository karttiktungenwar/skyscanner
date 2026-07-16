import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/core/common/widgets/circle_icon_button.dart';
import 'package:skyscanner/src/core/constants/theme.dart';
import 'package:skyscanner/src/features/detail/presentation/widgets/itinerary_day_tile.dart';
import 'package:skyscanner/src/features/tour/presentation/widgets/segmented_tabs.dart';


/// Screen 3: full tour detail with a "Tour schedule / Accommodation /
/// Booking details" segmented control and an expandable day-by-day
/// itinerary, plus a sticky "Book a tour" button.
class TourItineraryScreen extends StatefulWidget {
  final Tour tour;

  const TourItineraryScreen({
    super.key,
    required this.tour,
  });

  State<TourItineraryScreen> createState() => _TourItineraryScreenState();

}
class _TourItineraryScreenState extends State<TourItineraryScreen> {

  static const _tabs = ['Tour schedule', 'Accommodation', 'Booking details'];

  String _formatRange(DateTime start, DateTime end) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final startLabel = '${months[start.month - 1]} ${start.day}';
    final endLabel = '${months[end.month - 1]} ${end.day}';
    return '$startLabel – $endLabel';
  }

  final tourTabIndex = ValueNotifier<int>(0);
  final expandedDayIndex = ValueNotifier<int?>(0);

  void toggleExpandedDay(int index) {
    expandedDayIndex.value =
    expandedDayIndex.value == index ? null : index;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
              child: Row(
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    background: AppColors.chipUnselected,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(widget.tour.title,
                            style: AppText.sectionTitle.copyWith(fontSize: 17)),
                        Text(
                          _formatRange(widget.tour.startDate, widget.tour.endDate),
                          style: AppText.subtitle,
                        ),
                      ],
                    ),
                  ),
                  const CircleIconButton(
                    icon: Icons.favorite_border,
                    background: AppColors.chipUnselected,
                    onTap: _noop,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder<int>(
                valueListenable: tourTabIndex,
                builder: (context, selectedTab, _) {
                  return SegmentedTabs(
                    tabs: _tabs,
                    selectedIndex: selectedTab,
                    onSelected: (i) => tourTabIndex.value = i,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: tourTabIndex,
                builder: (context, selectedTab, _) {
                  if (selectedTab != 0) {
                    return Center(
                      child: Text(
                        '${_tabs[selectedTab]} content goes here',
                        style: AppText.subtitle,
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.tour.days}-Day ${widget.tour.title} Adventure',
                          style: AppText.sectionTitle,
                        ),
                        const SizedBox(height: 16),
                        ValueListenableBuilder<int?>(
                          valueListenable: expandedDayIndex,
                          builder: (context, expandedIndex, _) {
                            return Column(
                              children: List.generate(widget.tour.itinerary.length, (index) {
                                final day = widget.tour.itinerary[index];
                                return ItineraryDayTile(
                                  day: day,
                                  expanded: expandedIndex == index,
                                  onTap: () => toggleExpandedDay(index),
                                );
                              }),
                            );
                          },
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking flow goes here')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pillDark,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            child: const Text('Book a tour',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          ),
        ),
      ),
    );
  }
}

void _noop() {}
