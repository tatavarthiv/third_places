import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParkFilters {
  final double maxDistance;
  final Map<String, bool> sportsFacilities;
  final Map<String, bool> communityFacilities;
  final String searchQuery;

  const ParkFilters({
    this.maxDistance = 50.0,
    this.sportsFacilities = const {
      'Baseball': false,
      'Tennis': false,
      'Basketball': false,
      'Volleyball': false,
      'Golf': false,
      'Fitness Center': false,
      'Skateboarding': false,
    },
    this.communityFacilities = const {
      'Restroom': false,
      'Picnic Table': false,
      'Grill': false,
      'Playground': false,
      'Services': false,
      'RV Camping': false,
      'Parking': false,
      'Trail Path': false,
      'Camping Site': false,
      'Dog Park': false,
    },
    this.searchQuery = '',
  });

  ParkFilters copyWith({
    double? maxDistance,
    Map<String, bool>? sportsFacilities,
    Map<String, bool>? communityFacilities,
    String? searchQuery,
  }) {
    return ParkFilters(
      maxDistance: maxDistance ?? this.maxDistance,
      sportsFacilities: sportsFacilities ?? this.sportsFacilities,
      communityFacilities: communityFacilities ?? this.communityFacilities,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class ParkFiltersNotifier extends StateNotifier<ParkFilters> {
  ParkFiltersNotifier() : super(const ParkFilters());

  void updateDistance(double distance) {
    state = state.copyWith(maxDistance: distance);
  }

  void toggleSportsFacility(String facility, bool isEnabled) {
    state = state.copyWith(
      sportsFacilities: {
        ...state.sportsFacilities,
        facility: isEnabled,
      },
    );
  }

  void toggleCommunityFacility(String facility, bool isEnabled) {
    state = state.copyWith(
      communityFacilities: {
        ...state.communityFacilities,
        facility: isEnabled,
      },
    );
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void resetFilters() {
    state = const ParkFilters();
  }
}

final parkFiltersProvider =
    StateNotifierProvider<ParkFiltersNotifier, ParkFilters>((ref) {
  return ParkFiltersNotifier();
});