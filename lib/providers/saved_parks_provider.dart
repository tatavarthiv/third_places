import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';

class SavedParksNotifier extends StateNotifier<List<Park>> {
  SavedParksNotifier() : super([]);

  void toggleSavePark(Park park) {
    if (state.any((p) => p.id == park.id)) {
      state = state.where((p) => p.id != park.id).toList();
    } else {
      state = [...state, park];
    }
  }

  bool isParkSaved(Park park) {
    return state.any((p) => p.id == park.id);
  }
}

final savedParksProvider =
    StateNotifierProvider<SavedParksNotifier, List<Park>>((ref) {
  return SavedParksNotifier();
});
