import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:parks/models/park.dart';
import 'package:parks/util/distance_calculator.dart';

final distanceProvider = FutureProvider.family<String, Park>((ref, park) async {
  try {
    // Request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'location permissions denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return 'location permissions permanently denied';
    }

    // Get the current position
    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double calculatedDistance = DistanceCalculator.calculateDistance(
      startLatitude: currentPosition.latitude,
      startLongitude: currentPosition.longitude,
      endLatitude: park.coordinates.latitude,
      endLongitude: park.coordinates.longitude,
    );

    return calculatedDistance.toStringAsFixed(2);
  } catch (e) {
    return 'Unable to determine distance';
  }
});
