import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/providers/saved_parks_provider.dart';
import 'package:parks/widgets/explore/park_card_view.dart';

class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedParks = ref.watch(savedParksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Parks'),
      ),
      body: savedParks.isEmpty
          ? const Center(child: Text('No saved parks yet.'))
          : ListView.builder(
              itemCount: savedParks.length,
              itemBuilder: (context, index) {
                final park = savedParks[index];
                return ParkCard(park: park);
              },
            ),
    );
  }
}
