import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ParkMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String id;

  const ParkMapWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.id,
  }) : super(key: key);

  // Launch Google Maps
  Future<void> _launchGoogleMaps() async {
    final mapsUrl = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps',
      queryParameters: {
        'q': '$latitude,$longitude',
      },
    );
    if (await canLaunchUrl(mapsUrl)) {
      await launchUrl(mapsUrl);
    } else {
      throw 'Could not launch Google Maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 250,
        width: 375,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 13,
          ),
          markers: {
            Marker(
              markerId: MarkerId(id),
              position: LatLng(latitude, longitude),
            ),
          },
          onTap: (LatLng tappedLocation) {
            _launchGoogleMaps();
          },
          myLocationEnabled: true,
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
