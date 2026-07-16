import 'package:go_router/go_router.dart';
import 'package:skyscanner/src/core/common/domain/entity/entity_data.dart';
import 'package:skyscanner/src/features/detail/presentation/screens/destination_detail_screen.dart';
import 'package:skyscanner/src/features/home/presentation/screens/home_screen.dart';
import 'package:skyscanner/src/features/tour/presentation/screens/tour_itinerary_screen.dart';

import 'app_route_names.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRouteNames.home,
    routes: [
      GoRoute(
        path: AppRouteNames.home,
        name: AppRouteNames.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRouteNames.detail,
        name: AppRouteNames.detail,
        builder: (context, state) {
          // Access the arguments via state.extra
          final destination = state.extra as Destination;
          return DestinationDetailScreen(destination: destination);
        },
      ),
      GoRoute(
        path: AppRouteNames.tour,
        name: AppRouteNames.tour,
        builder: (context, state) {
          // Access the arguments via state.extra
          final tour = state.extra as Tour;
          return TourItineraryScreen(tour: tour);
        },
      ),
    ],
  );
}
