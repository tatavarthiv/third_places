import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/providers/current_location_provider.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  late GoogleMapController _mapController; // To control the map
  LatLng? _userLocation; // Cached user location

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _recenterMap() async {
    if (_userLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newLatLng(_userLocation!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationData = ref.watch(currentLocationProvider);

    return Scaffold(
      body: locationData.when(
        data: (location) {
          _userLocation = LatLng(location.latitude, location.longitude);

          return Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _userLocation!,
                  zoom: 12,
                ),
                myLocationEnabled: false, // Prevent the blue dot
                myLocationButtonEnabled: false, // Disable the default button
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                rotateGesturesEnabled: true,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: _recenterMap,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.my_location, color: Colors.black),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error fetching location: $error'),
        ),
      ),
    );
  }
}
