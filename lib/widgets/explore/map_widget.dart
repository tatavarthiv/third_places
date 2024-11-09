import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ParkMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;

  const ParkMapWidget({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  // Launch Google Maps
  Future<void> _launchGoogleMaps() async {
    final url = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
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
            markerId: MarkerId('parkMarker'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
              title: 'Park Location',
            ),
          ),
        },
        onTap: (LatLng tappedLocation) {
        _launchGoogleMaps();
        },
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        ),
      )      
    );
  }
}
