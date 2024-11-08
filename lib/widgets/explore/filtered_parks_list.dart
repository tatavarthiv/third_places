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
                  parksWithDistances.add(MapEntry(distance, park));
                }
              });
            }

            // Sort parks by distance
            parksWithDistances.sort((a, b) => a.key.compareTo(b.key));

            // If no parks match the filter criteria
            if (parksWithDistances.isEmpty) {
              return const Center(
                child: Text('No parks found within the selected distance'),
              );
            }

            // Extract just the parks for display
            final filteredParks =
                parksWithDistances.map((e) => e.value).toList();

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
