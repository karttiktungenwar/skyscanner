import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';

/// Static mock data standing in for a real backend/API.
/// Swap this out for real network calls later without touching the UI.
class ModelData {
  static const List<String> categories = [
    'Asia',
    'Europe',
    'South America',
    'North America',
  ];

  static final List<Destination> destinations = [
    // -------------------------------------------------------------------------
    // ASIA (5)
    // -------------------------------------------------------------------------
    const Destination(
      id: 'kyoto',
      city: 'Kyoto',
      country: 'Japan',
      imageUrl:
      'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=900&q=80',
      rating: 4.9,
      reviewCount: 210,
      continent: 'Asia',
      description:
      'Kyoto, once the imperial capital of Japan, is home to thousands '
          'of temples, classical gardens and traditional wooden houses.',
    ),
    const Destination(
      id: 'bali',
      city: 'Ubud',
      country: 'Indonesia',
      imageUrl:
      'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=900&q=80',
      rating: 4.8,
      reviewCount: 185,
      continent: 'Asia',
      description:
      'Ubud is the cultural heart of Bali, surrounded by lush rainforests, '
          'iconic terraced rice paddies, and historic Hindu temples.',
    ),
    const Destination(
      id: 'bangkok',
      city: 'Bangkok',
      country: 'Thailand',
      imageUrl:
      'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=900&q=80',
      rating: 4.7,
      reviewCount: 162,
      continent: 'Asia',
      description:
      'Bangkok is famous for ornate shrines, bustling street life, '
          'vibrant floating markets, and rich culinary traditions.',
    ),
    const Destination(
      id: 'singapore',
      city: 'Singapore',
      country: 'Singapore',
      imageUrl:
      'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=900&q=80',
      rating: 4.9,
      reviewCount: 220,
      continent: 'Asia',
      description:
      'A global financial hub known for tropical greenery, iconic futuristic '
          'architecture like Marina Bay Sands, and world-class street food.',
    ),
    const Destination(
      id: 'ho-chi-minh',
      city: 'Ho Chi Minh City',
      country: 'Vietnam',
      imageUrl:
      'https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=900&q=80',
      rating: 4.6,
      reviewCount: 115,
      continent: 'Asia',
      description:
      'Formerly known as Saigon, Ho Chi Minh City is famous for its vibrant energy, '
          'French colonial landmarks, and delicious coffee culture.',
    ),

    // -------------------------------------------------------------------------
    // EUROPE (5)
    // -------------------------------------------------------------------------
    const Destination(
      id: 'santorini',
      city: 'Santorini',
      country: 'Greece',
      imageUrl:
      'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=900&q=80',
      rating: 4.7,
      reviewCount: 175,
      continent: 'Europe',
      description:
      'Santorini is famed for its whitewashed, cubist buildings clinging '
          'to dramatic caldera cliffs above the Aegean Sea.',
    ),
    const Destination(
      id: 'paris',
      city: 'Paris',
      country: 'France',
      imageUrl:
      'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=900&q=80',
      rating: 4.8,
      reviewCount: 310,
      continent: 'Europe',
      description:
      'France\'s capital is a global center for art, fashion, gastronomy, '
          'and culture, famed for landmarks like the Eiffel Tower and Louvre.',
    ),
    const Destination(
      id: 'rome',
      city: 'Rome',
      country: 'Italy',
      imageUrl:
      'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=900&q=80',
      rating: 4.9,
      reviewCount: 280,
      continent: 'Europe',
      description:
      'The Eternal City blends nearly 3,000 years of globally influential art, '
          'architecture, and ancient ruins with vibrant city living.',
    ),
    const Destination(
      id: 'barcelona',
      city: 'Barcelona',
      country: 'Spain',
      imageUrl:
      'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=900&q=80',
      rating: 4.7,
      reviewCount: 195,
      continent: 'Europe',
      description:
      'Known for Antoni Gaudí’s whimsical architecture, Mediterranean beaches, '
          'and a lively tapas and nightlife scene.',
    ),
    const Destination(
      id: 'interlaken',
      city: 'Interlaken',
      country: 'Switzerland',
      imageUrl:
      'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?w=900&q=80',
      rating: 4.9,
      reviewCount: 140,
      continent: 'Europe',
      description:
      'Nestled between emerald-colored lakes and soaring Alpine peaks, '
          'Interlaken is Switzerland\'s premier adventure and scenic hub.',
    ),

    // -------------------------------------------------------------------------
    // SOUTH AMERICA (5)
    // -------------------------------------------------------------------------
    const Destination(
      id: 'rio',
      city: 'Rio de Janeiro',
      country: 'Brazil',
      imageUrl:
      'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=900&q=80',
      rating: 5.0,
      reviewCount: 143,
      continent: 'South America',
      description:
      'Rio de Janeiro, often simply called Rio, is one of Brazil\'s most '
          'iconic cities, renowned for its dramatic mountains, golden beaches '
          'and vibrant culture. From Christ the Redeemer to Copacabana, every '
          'corner tells a story worth exploring.',
    ),
    const Destination(
      id: 'patagonia',
      city: 'Patagonia',
      country: 'Argentina',
      imageUrl:
      'https://images.unsplash.com/photo-1531065208531-4036c0dba3ca?w=900&q=80',
      rating: 4.8,
      reviewCount: 98,
      continent: 'South America',
      description:
      'Patagonia is a vast, sparsely populated region shared by Argentina '
          'and Chile, famous for its glaciers, jagged peaks and endless '
          'windswept steppe.',
    ),
    const Destination(
      id: 'cusco',
      city: 'Cusco & Machu Picchu',
      country: 'Peru',
      imageUrl:
      'https://images.unsplash.com/photo-1526392060635-9d6019884377?w=900&q=80',
      rating: 4.9,
      reviewCount: 260,
      continent: 'South America',
      description:
      'The gateway to the ancient Incan citadel of Machu Picchu, Cusco boasts '
          'rich history, Spanish colonial architecture, and high-altitude mountain vistas.',
    ),
    const Destination(
      id: 'buenos-aires',
      city: 'Buenos Aires',
      country: 'Argentina',
      imageUrl:
      'https://images.unsplash.com/photo-1589909202802-8f4aadce1849?w=900&q=80',
      rating: 4.7,
      reviewCount: 130,
      continent: 'South America',
      description:
      'Argentina\'s cosmopolitan capital, known for European-style avenues, '
          'passionate tango, world-class steakhouse dining, and colorful neighborhoods.',
    ),
    const Destination(
      id: 'atacama',
      city: 'Atacama Desert',
      country: 'Chile',
      imageUrl:
      'https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?w=900&q=80',
      rating: 4.8,
      reviewCount: 88,
      continent: 'South America',
      description:
      'The driest non-polar desert in the world, featuring otherworldly salt flats, '
          'geysers, clear night skies for stargazing, and dramatic red rock formations.',
    ),

    // -------------------------------------------------------------------------
    // NORTH AMERICA (5)
    // -------------------------------------------------------------------------
    const Destination(
      id: 'banff',
      city: 'Banff',
      country: 'Canada',
      imageUrl:
      'https://images.unsplash.com/photo-1503614472-8c93d56e92ce?w=900&q=80',
      rating: 4.9,
      reviewCount: 132,
      continent: 'North America',
      description:
      'Banff National Park sits high in the Canadian Rockies, with '
          'turquoise glacial lakes and snow-capped peaks in every direction.',
    ),
    const Destination(
      id: 'new-york',
      city: 'New York City',
      country: 'United States',
      imageUrl:
      'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=900&q=80',
      rating: 4.8,
      reviewCount: 340,
      continent: 'North America',
      description:
      'The city that never sleeps offers world-renowned museums, Central Park, '
          'Broadway theaters, and iconic skylines.',
    ),
    const Destination(
      id: 'cancun',
      city: 'Cancún',
      country: 'Mexico',
      imageUrl:
      'https://images.unsplash.com/photo-1510097467424-192d713be8b2?w=900&q=80',
      rating: 4.7,
      reviewCount: 168,
      continent: 'North America',
      description:
      'A Mexican resort town on the Yucatan Peninsula known for turquoise Caribbean '
          'waters, white sand beaches, and nearby ancient Mayan ruins.',
    ),
    const Destination(
      id: 'yosemite',
      city: 'Yosemite National Park',
      country: 'United States',
      imageUrl:
      'https://images.unsplash.com/photo-1426604966848-d7adac402bff?w=900&q=80',
      rating: 4.9,
      reviewCount: 205,
      continent: 'North America',
      description:
      'Located in California\'s Sierra Nevada mountains, Yosemite is famed for '
          'giant sequoias, dramatic granite cliffs like El Capitan, and soaring waterfalls.',
    ),
    const Destination(
      id: 'vancouver',
      city: 'Vancouver',
      country: 'Canada',
      imageUrl:
      'https://images.unsplash.com/photo-1559511260-66a654ae982a?w=900&q=80',
      rating: 4.8,
      reviewCount: 118,
      continent: 'North America',
      description:
      'A vibrant coastal seaport city in British Columbia, celebrated for its '
          'balance of outdoor ocean-and-mountain recreation with urban sophistication.',
    ),
  ];

  static final List<Tour> toursForRio = [
    Tour(
      id: 'iconic-brazil',
      title: 'Iconic Brazil',
      days: 8,
      priceFrom: 659,
      rating: 4.6,
      reviewCount: 56,
      imageUrl:
      'https://images.unsplash.com/photo-1531065208531-4036c0dba3ca?w=900&q=80',
      startDate: DateTime(2026, 10, 21),
      endDate: DateTime(2026, 11, 1),
      itinerary: [
        const ItineraryDay(
          dayNumber: 1,
          title: 'Arrival to Rio de Janeiro',
          imageUrl:
          'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=400&q=80',
          activities: [
            ItineraryActivity(
              period: 'Morning',
              description: 'Arrive in Rio de Janeiro and transfer to your hotel',
            ),
            ItineraryActivity(
              period: 'Afternoon',
              description: 'Free time to relax or explore the nearby area',
            ),
            ItineraryActivity(
              period: 'Evening',
              description: 'Welcome dinner at a traditional Brazilian restaurant',
            ),
          ],
        ),
        const ItineraryDay(
          dayNumber: 2,
          title: 'Rio de Janeiro Highlights',
          imageUrl:
          'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=400&q=80',
          activities: [
            ItineraryActivity(
              period: 'Morning',
              description: 'Visit Christ the Redeemer at Corcovado',
            ),
            ItineraryActivity(
              period: 'Afternoon',
              description: 'Cable car up Sugarloaf Mountain',
            ),
            ItineraryActivity(
              period: 'Evening',
              description: 'Stroll along Copacabana beach at sunset',
            ),
          ],
        ),
        const ItineraryDay(
          dayNumber: 3,
          title: 'Tijuca Forest & Santa Teresa',
          imageUrl:
          'https://images.unsplash.com/photo-1518639192441-8fce0a366e2e?w=400&q=80',
          activities: [
            ItineraryActivity(
              period: 'Morning',
              description: 'Guided hike through Tijuca National Park',
            ),
            ItineraryActivity(
              period: 'Afternoon',
              description: 'Explore the artsy streets of Santa Teresa',
            ),
            ItineraryActivity(
              period: 'Evening',
              description: 'Live samba show and dinner',
            ),
          ],
        ),
      ],
    ),
    Tour(
      id: 'beach-escape',
      title: 'Beach Escape',
      days: 8,
      priceFrom: 549,
      rating: 4.8,
      reviewCount: 41,
      imageUrl:
      'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=900&q=80',
      startDate: DateTime(2026, 11, 3),
      endDate: DateTime(2026, 11, 14),
      itinerary: [
        const ItineraryDay(
          dayNumber: 1,
          title: 'Arrival & Copacabana',
          imageUrl:
          'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=400&q=80',
          activities: [
            ItineraryActivity(
              period: 'Morning',
              description: 'Arrive and check in to your beachfront hotel',
            ),
            ItineraryActivity(
              period: 'Afternoon',
              description: 'Relax on Copacabana beach',
            ),
            ItineraryActivity(
              period: 'Evening',
              description: 'Sunset drinks at a beach kiosk',
            ),
          ],
        ),
      ],
    ),
  ];

  static Tour get iconicBrazil => toursForRio.first;
}
