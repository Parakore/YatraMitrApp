import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/nearby_place.dart';
import '../repository/nearby_repository.dart';

part 'nearby_viewmodel.g.dart';

/// ViewModel for handling Nearby Services logic.
/// Responsible for fetching and providing nearby data state.
@riverpod
class NearbyViewModel extends _$NearbyViewModel {
  @override
  FutureOr<List<NearbyPlace>> build() async {
    return _fetch();
  }

  Future<List<NearbyPlace>> _fetch() async {
    final repository = ref.read(nearbyRepositoryProvider);
    return await repository.getNearbyPlaces();
  }

  /// Refresh the data
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch());
  }
}
