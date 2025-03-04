import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/providers/current_location_provider.dart';

class ParkMapWidget extends ConsumerWidget {
  final double latitude;
  final double longitude;
  final String parkId;
  final String parkName;

  const ParkMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.parkId,
    required this.parkName,
  });

  // Launch Google Maps URL with directions from current location to park 
  Future<void> _launchGoogleMaps(BuildContext context, WidgetRef ref) async {
    final locationValue = ref.watch(currentLocationProvider);

    locationValue.when(
      data: (position) async {
        final userLat = position.latitude;
        final userLong = position.longitude;

        final mapsUrl = Uri(
          scheme: 'https',
          host: 'www.google.com',
          path: '/maps',
          queryParameters: {
            'saddr': '$userLat,$userLong', 
            'daddr': '$latitude,$longitude', 
            'dirflg': 'd', // Driving directions
          },
        );

        // Launch the URL if device can support it
        if (await canLaunchUrl(mapsUrl)) {
          await launchUrl(mapsUrl);
        } else {
          throw 'Could not launch Google Maps with directions';
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => throw 'Error fetching location: $error',
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Align(
          alignment: Alignment.centerLeft, // Align the text to the left
          child: Text(
            'Map',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          )),
          const SizedBox(height: 16),

          // Google Map widget
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              height: 275, 
              width: double.infinity, 
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(latitude, longitude),
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(parkId),
                    position: LatLng(latitude, longitude),
                    infoWindow: InfoWindow(
                      title: parkName,
                    ),
                  ),
                },
                myLocationEnabled: true,
                zoomControlsEnabled: true,
              ),
            )
          ),
          
          // Get Directions Button wrapped in a Container to match map width
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10), 
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _launchGoogleMaps(context, ref),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer, 
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text('Get Directions'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

