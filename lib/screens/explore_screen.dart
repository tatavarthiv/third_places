import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/widgets/explore/explore_header.dart';
import 'package:parks/widgets/explore/filtered_parks_list.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior
              .translucent, // Ensures gesture detection works even on empty spaces
          child: const Column(
            children: [
              ExploreHeader(),
              Expanded(
                child: FilteredParksList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
