import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/providers/park_filters_provider.dart';

class ParkFiltersSheet extends ConsumerWidget {
  const ParkFiltersSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(parkFiltersProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(parkFiltersProvider.notifier).resetFilters();
                  },
                  child: const Text('Reset All'),
                ),
              ],
            ),

            const Divider(),

            // Distance Filter Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Distance',
                  style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Show parks within ${filters.maxDistance.toStringAsFixed(1)} miles',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
                Slider(
                  value: filters.maxDistance,
                  min: 1.0,
                  max: 100000.0,
                  divisions: 99,
                  onChanged: (value) {
                    ref.read(parkFiltersProvider.notifier).updateDistance(value);
                  },
                ),
              ],
            ),

            const Divider(),

            // Sports Facilities Filter Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sports Facilities',
                  style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                ),
                const SizedBox(height: 8),
                ...filters.sportsFacilities.entries.map((facility) {
                  return CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(facility.key),
                    value: facility.value,
                    onChanged: (isChecked) {
                      ref.read(parkFiltersProvider.notifier).toggleSportsFacility(
                        facility.key,
                        isChecked ?? false,
                      );
                    },
                  );
                }).toList(),
              ],
            ),

            const Divider(),

            // Community Facilities Filter Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Community Facilities',
                  style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                ),
                const SizedBox(height: 8),
                ...filters.communityFacilities.entries.map((facility) {
                  return CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(facility.key),
                    value: facility.value,
                    onChanged: (isChecked) {
                      ref.read(parkFiltersProvider.notifier).toggleCommunityFacility(
                        facility.key,
                        isChecked ?? false,
                      );
                    },
                  );
                }).toList(),
              ],
            ),

            const SizedBox(height: 16),

            // Apply Button
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Apply Filters'),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
