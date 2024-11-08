import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParkFilters {
  final double maxDistance;
  // Future filters will go here, for example:
  // final List<String> amenities;
  // final bool isOpenNow;
  // final List<String> activities;

  const ParkFilters({
    this.maxDistance = 50.0,
    // Future defaults will go here
  });

  ParkFilters copyWith({
    double? maxDistance,
    // Future parameters will go here
  }) {
    return ParkFilters(
      maxDistance: maxDistance ?? this.maxDistance,
      // Future parameters will be copied here
    );
  }
}

class ParkFiltersNotifier extends StateNotifier<ParkFilters> {
  ParkFiltersNotifier() : super(const ParkFilters());

  void updateDistance(double distance) {
    state = state.copyWith(maxDistance: distance);
  }

  void resetFilters() {
    state = const ParkFilters();
  }

  // Future update methods will go here
  // void updateAmenities(List<String> amenities) { ... }
  // void toggleOpenNow(bool value) { ... }
}

final parkFiltersProvider =
    StateNotifierProvider<ParkFiltersNotifier, ParkFilters>((ref) {
  return ParkFiltersNotifier();
});
