import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final currentLocationProvider = FutureProvider<Position>((ref) async {
  // Request location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions permanently denied');
  }

  // Get the current position
  return await Geolocator.getCurrentPosition();
});
