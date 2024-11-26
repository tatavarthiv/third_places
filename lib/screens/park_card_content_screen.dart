import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/assets/buttons/custom_back_button.dart';
import 'package:parks/assets/buttons/custom_save_park_button.dart';
import 'package:parks/models/park.dart';
import 'package:parks/providers/distance_provider.dart'; 
import 'package:parks/widgets/explore/map_widget.dart'; 
import 'package:parks/widgets/explore/opening_hours_widget.dart'; 
import 'package:parks/widgets/explore/sports_facilities.dart'; 
import 'package:parks/widgets/explore/community_facilities.dart'; 
import 'package:parks/widgets/explore/weather_widget.dart'; 
import 'package:parks/widgets/explore/popular_times_widget.dart'; 


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
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 250),
                          Text(
                            park.name,
                            style: TextStyle(
                                fontSize: 24, 
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${park.cityId}, ${park.countyId}',
                            style: TextStyle(
                                fontSize: 24, 
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  '$distance mi · Local park · 10 acres · ',
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8), 
                              WeatherWidget(
                                latitude: park.coordinates.latitude,  
                                longitude: park.coordinates.longitude, 
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),
                          
                          OpeningHoursWidget(openingHours: park.openingHours),
                          HourlyOccupancyWidget(
                            openingHours: park.openingHours,
                            popularTimes: park.popularTimes,
                          ),
                          const SizedBox(height: 16),

                          SportsFacilitiesWidget(
                            sportsFacilities: park.sportsFacilities,
                          ),
                          const SizedBox(height: 16),

                          CommunityFacilitiesWidget(
                            communityFacilities: park.communityFacilities,
                          ),
                          const SizedBox(height: 16),

                          // Google Maps Widget
                          ParkMapWidget(
                            parkId: park.id,
                            parkName: park.name,
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
