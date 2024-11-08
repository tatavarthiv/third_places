import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/event.dart';

class SavedEventsNotifier extends StateNotifier<List<ParkEvent>> {
  SavedEventsNotifier() : super([]);

  void toggleSaveEvent(ParkEvent event) {
    if (state.any((e) => e.id == event.id)) {
      state = state.where((e) => e.id != event.id).toList();
    } else {
      state = [...state, event];
    }
  }

  bool isEventSaved(ParkEvent event) {
    return state.any((e) => e.id == event.id);
  }
}

final savedEventsProvider =
    StateNotifierProvider<SavedEventsNotifier, List<ParkEvent>>((ref) {
  return SavedEventsNotifier();
});
