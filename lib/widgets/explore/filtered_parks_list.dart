import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';
import 'package:parks/providers/current_location_provider.dart';
import 'package:parks/providers/distance_provider.dart';
import 'package:parks/providers/park_data_provider.dart';
import 'package:parks/providers/park_filters_provider.dart';
import 'package:parks/widgets/explore/park_card_list.dart';

class FilteredParksList extends ConsumerWidget {
  const FilteredParksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(parkFiltersProvider);
    final parksData = ref.watch(parksProvider);
    final locationData = ref.watch(currentLocationProvider);

    return parksData.when(
      data: (parks) {
        return locationData.when(
          data: (_) {
            // Create a list to store parks with their distances
            List<MapEntry<double, Park>> parksWithDistances = [];

            // Process each park's distance
            for (final park in parks) {
              final distanceValue = ref.watch(distanceProvider(park));

              distanceValue.whenData((distanceStr) {
                final distance = double.tryParse(distanceStr);
                if (distance != null && distance <= filters.maxDistance) {
                  // Check if the park satisfies the sports and community facilities filters
                  final hasRequiredSportsFacilities = filters.sportsFacilities.entries.every((facility) {
                    if (facility.value) {
                      switch (facility.key) {
                        case 'Baseball':
                          return park.sportsFacilities.hasBaseball;
                        case 'Tennis':
                          return park.sportsFacilities.hasTennis;
                        case 'Basketball':
                          return park.sportsFacilities.hasBasketball;
                        case 'Volleyball':
                          return park.sportsFacilities.hasVolleyball;
                        case 'Golf':
                          return park.sportsFacilities.hasGolf;
                        case 'Fitness Center':
                          return park.sportsFacilities.hasFitnessCenter;
                        case 'Skateboarding':
                          return park.sportsFacilities.hasSkateboarding;
                        default:
                          return true;
                      }
                    }
                    return true;
                  });

                  final hasRequiredCommunityFacilities = filters.communityFacilities.entries.every((facility) {
                    if (facility.value) {
                      switch (facility.key) {
                        case 'Restroom':
                          return park.communityFacilities.hasRestroom;
                        case 'Picnic Table':
                          return park.communityFacilities.hasPicnicTable;
                        case 'Grill':
                          return park.communityFacilities.hasGrill;
                        case 'Playground':
                          return park.communityFacilities.hasPlayground;
                        case 'Services':
                          return park.communityFacilities.hasServices;
                        case 'RV Camping':
                          return park.communityFacilities.hasRVCamping;
                        case 'Parking':
                          return park.communityFacilities.hasParking;
                        case 'Trail Path':
                          return park.communityFacilities.hasTrailPath;
                        case 'Camping Site':
                          return park.communityFacilities.hasCampingSite;
                        case 'Dog Park':
                          return park.communityFacilities.hasDogPark;
                        default:
                          return true;
                      }
                    }
                    return true;
                  });

                  if (hasRequiredSportsFacilities && hasRequiredCommunityFacilities) {
                    parksWithDistances.add(MapEntry(distance, park));
                  }
                }
              });
            }

            // Sort parks by distance
            parksWithDistances.sort((a, b) => a.key.compareTo(b.key));

            // If no parks match the filter criteria
            if (parksWithDistances.isEmpty) {
              return const Center(
                child: Text('No parks found matching the selected filters'),
              );
            }

            // Extract just the parks for display
            final filteredParks = parksWithDistances
              .map((e) => e.value)
              .where((park) {
                // Check if the park name matches the search query
                final query = filters.searchQuery.toLowerCase();
                return query.isEmpty || park.name.toLowerCase().contains(query);
              })
              .toList();


            return ParksCardList(parks: filteredParks);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Text('Error getting location: $error'),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}
