import 'package:flutter/material.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/core/constants/theme.dart';
import 'itinerary_day_tile.dart';

class TourSchedule extends StatefulWidget {
  final Tour tour;

  const TourSchedule({super.key, required this.tour});

  @override
  State<TourSchedule> createState() => _TourScheduleState();
}

class _TourScheduleState extends State<TourSchedule> {
  ValueNotifier<int?> expandedDayIndex = ValueNotifier<int?>(0);

  void toggleExpandedDay(int index) {
    expandedDayIndex.value = expandedDayIndex.value == index ? null : index;
  }

  @override
  void dispose() {
    expandedDayIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                children: List.generate(
                  widget.tour.itinerary.length,
                      (index) {
                    final day = widget.tour.itinerary[index];
                    return ItineraryDayTile(
                      day: day,
                      expanded: expandedIndex == index,
                      onTap: () => toggleExpandedDay(index),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}