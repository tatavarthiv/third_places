import 'package:flutter/material.dart';
import 'package:parks/models/park.dart';

class ParkCardContentScreen extends StatelessWidget {
  final Park park;

  const ParkCardContentScreen({super.key, required this.park});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(park.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              park.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Text(
            //   park.description,
            //   style: TextStyle(fontSize: 16),
            // ),
            const SizedBox(height: 16),
            Text(
              'Location: ${park.location}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Text(
            //   'Opening Hours: ${park.openingHours}',
            //   style: TextStyle(fontSize: 16),
            // ),
            // Add more park details here
          ],
        ),
      ),
    );
  }
}
