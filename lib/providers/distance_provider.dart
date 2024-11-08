import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';
import 'package:parks/providers/current_location_provider.dart';
import 'package:parks/util/distance_calculator.dart';

final distanceProvider = Provider.family<AsyncValue<String>, Park>((ref, park) {
  final locationValue = ref.watch(currentLocationProvider);

  return locationValue.when(
    data: (position) {
      try {
        double calculatedDistance = DistanceCalculator.calculateDistance(
          startLatitude: position.latitude,
          startLongitude: position.longitude,
          endLatitude: park.coordinates.latitude,
          endLongitude: park.coordinates.longitude,
        );

        return AsyncValue.data(calculatedDistance.toStringAsFixed(2));
      } catch (e) {
        return AsyncValue.error(e, StackTrace.current);
      }
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
});
