import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/event.dart';
import 'package:parks/providers/saved_events_provider.dart';

class CustomSaveEventButton extends ConsumerWidget {
  final ParkEvent event;
  final double size;

  const CustomSaveEventButton({
    super.key,
    required this.event,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaved = ref.watch(savedEventsProvider).any((e) => e.id == event.id);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints.tightFor(width: 35, height: 30),
      child: IconButton(
        icon: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Colors.red : colorScheme.onSurfaceVariant,
          size: size,
        ),
        onPressed: () {
          ref.read(savedEventsProvider.notifier).toggleSaveEvent(event);
        },
        padding: const EdgeInsets.all(6.0),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
