import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';
import 'package:parks/util/distance_calculator.dart';

final distanceProvider = FutureProvider.family<String, Park>((ref, park) async {
  try {
    // TODO: Get current location of user by creating a popup to request permission
    // Position currentPosition = await DistanceCalculator.getCurrentLocation();

    double calculatedDistance = DistanceCalculator.calculateDistance(
      // startLatitude: currentPosition.latitude,
      // startLongitude: currentPosition.longitude,
      startLatitude: 37.543400,
      startLongitude: -121.971800,
      endLatitude: park.coordinates.latitude,
      endLongitude: park.coordinates.longitude,
    );

    return calculatedDistance.toStringAsFixed(2);
  } catch (e) {
    return 'Unable to determine distance';
  }
});
