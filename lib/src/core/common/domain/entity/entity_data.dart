/// A destination the user can browse from the Home screen
/// (e.g. "Rio de Janeiro, Brazil").
class Destination {
  final String id;
  final String city;
  final String country;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String description;
  final String continent; // used for the category filter chips

  const Destination({
    required this.id,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.continent,
  });
}

/// A bookable multi-day tour shown under "Upcoming tours".
class Tour {
  final String id;
  final String title;
  final int days;
  final int priceFrom;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final List<ItineraryDay> itinerary;

  const Tour({
    required this.id,
    required this.title,
    required this.days,
    required this.priceFrom,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.itinerary,
  });
}

/// A single day inside a [Tour]'s itinerary, e.g. "Day 1 - Arrival".
class ItineraryDay {
  final int dayNumber;
  final String title;
  final String imageUrl;
  final List<ItineraryActivity> activities;

  const ItineraryDay({
    required this.dayNumber,
    required this.title,
    required this.imageUrl,
    required this.activities,
  });
}

/// One time-of-day activity line, e.g. "Morning - Arrive and transfer".
class ItineraryActivity {
  final String period; // Morning / Afternoon / Evening
  final String description;

  const ItineraryActivity({required this.period, required this.description});
}
