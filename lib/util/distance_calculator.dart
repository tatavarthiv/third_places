import 'dart:math';
import 'package:geolocator/geolocator.dart';

class DistanceCalculator {
  // Calculate the distance between two points using the Haversine formula
  static double calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    const int radiusOfEarthKm = 6371;
    const double kmToMilesConversionFactor = 0.621371;

    final double latDistance = _toRadians(endLatitude - startLatitude);
    final double lonDistance = _toRadians(endLongitude - startLongitude);

    final double a = sin(latDistance / 2) * sin(latDistance / 2) +
        cos(_toRadians(startLatitude)) *
            cos(_toRadians(endLatitude)) *
            sin(lonDistance / 2) *
            sin(lonDistance / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate distance in kilometers and convert to miles
    double distanceInKm = radiusOfEarthKm * c;
    double distanceInMiles = distanceInKm * kmToMilesConversionFactor;

    return distanceInMiles;
  }

  // Convert degrees to radians
  static double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  // Function to get current location
  static Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
