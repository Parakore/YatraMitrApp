import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/nearby_place.dart';
import '../repository/nearby_repository.dart';

part 'nearby_viewmodel.g.dart';

/// ViewModel for handling Nearby Services logic.
/// Responsible for fetching and providing nearby data state.
@riverpod
class NearbyViewModel extends _$NearbyViewModel {
  String? _currentCategory;

  @override
  FutureOr<List<NearbyPlace>> build() async {
    return _fetch();
  }

  Future<List<NearbyPlace>> _fetch() async {
    final repository = ref.read(nearbyRepositoryProvider);
    final places = await repository.getNearbyPlaces();
    if (_currentCategory == null || _currentCategory == 'All') return places;
    return places.where((p) => p.category.toLowerCase() == _currentCategory!.toLowerCase()).toList();
  }

  void filterByCategory(String? category) {
    _currentCategory = category;
    refresh();
  }

  /// Refresh the data
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch());
  }
}
