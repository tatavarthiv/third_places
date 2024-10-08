import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';
import 'package:parks/providers/saved_parks_provider.dart';

class CustomSaveParkButton extends ConsumerWidget {
  final Park park;
  final double size;

  const CustomSaveParkButton({
    super.key,
    this.size = 18.0,
    required this.park,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaved = ref.watch(savedParksProvider).any((p) => p.id == park.id);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      constraints: const BoxConstraints.tightFor(width: 30, height: 30),
      child: IconButton(
        icon: Icon(
          isSaved ? Icons.bookmark : Icons.bookmark_border,
          color: isSaved ? Colors.amber : Colors.white,
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
