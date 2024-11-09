import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/assets/buttons/custom_back_button.dart';
import 'package:parks/assets/buttons/custom_save_park_button.dart';
import 'package:parks/models/park.dart';
import 'package:parks/providers/distance_provider.dart'; 
import 'package:parks/widgets/explore/map_widget.dart'; 

class ParkCardContentScreen extends ConsumerWidget {
  final Park park;

  const ParkCardContentScreen({super.key, required this.park});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch distance from the provider
    final distanceAsyncValue = ref.watch(distanceProvider(park));

    // Use the 'when' method to handle different states of distance calculation
    return distanceAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      // Error state
      error: (error, _) => Center(
        child: Text(
          'Error calculating distance: $error',
          style: const TextStyle(fontSize: 16),
        ),
      ),

      // Data state
      data: (distance) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    park.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 250),
                          Text(
                            park.name,
                            style: const TextStyle(
                                fontSize: 24, 
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Location: ${park.location}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // Display distance
                          Text(
                            'Distance: $distance miles',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          ParkMapWidget(
                            latitude: park.coordinates.latitude,
                            longitude: park.coordinates.longitude,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: 55,
                left: 16,
                child: CustomBackButton(),
              ),
              Positioned(
                top: 55,
                right: 16,
                child: CustomSaveParkButton(park: park),
              ),
            ],
          ),
        );
      },
    );
  }
}
