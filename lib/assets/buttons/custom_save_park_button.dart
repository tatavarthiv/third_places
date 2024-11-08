// custom_save_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';
import 'package:parks/providers/saved_parks_provider.dart';

class CustomSaveParkButton extends ConsumerWidget {
  final Park park;
  final double size;

  const CustomSaveParkButton({
    super.key,
    this.size = 24.0,
    required this.park,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaved = ref.watch(savedParksProvider).any((p) => p.id == park.id);

    return Container(
      constraints: const BoxConstraints.tightFor(width: 35, height: 30),
      child: IconButton(
        icon: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Colors.red : Colors.white,
          size: size,
        ),
        onPressed: () {
          ref.read(savedParksProvider.notifier).toggleSavePark(park);
        },
        padding: const EdgeInsets.all(6.0),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
