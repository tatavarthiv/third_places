import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/widgets/explore/explore_search_bar.dart';
import 'package:parks/widgets/explore/park_card_list.dart';
import 'package:parks/providers/park_data_provider.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access park data from the provider
    final parksData = ref.watch(parksProvider);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context)
                .unfocus(); // Unfocus search bar and dismiss keyboard
          },
          child: Column(
            children: [
              const ExploreSearchBar(),
              Expanded(
                child: parksData.when(
                  data: (parks) => ParksCardList(parks: parks),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
