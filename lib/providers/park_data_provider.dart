import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parks/models/park.dart';
import 'package:parks/firebase/firestore_service.dart';

class ParksNotifier extends StateNotifier<AsyncValue<List<Park>>> {
  ParksNotifier() : super(const AsyncLoading()) {
    _loadParks();
  }

  Future<void> _loadParks() async {
    try {
      final parks = await ParkService().getParks();
      state = AsyncValue.data(parks);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void refreshParks() => _loadParks();
}

final parksProvider =
    StateNotifierProvider<ParksNotifier, AsyncValue<List<Park>>>((ref) {
  return ParksNotifier();
});
