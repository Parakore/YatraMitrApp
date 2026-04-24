import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/hive_service.dart';
import '../model/nearby_place.dart';
import '../service/nearby_service.dart';

/// Repository for coordinating nearby data.
/// Implements offline-first strategy: Cache -> API -> Update Cache.
class NearbyRepository {
  final NearbyService _service;
  final HiveService _hiveService;
  static const String _boxName = 'nearby_places';

  NearbyRepository(this._service, this._hiveService);

  /// Get nearby places with offline support
  Future<List<NearbyPlace>> getNearbyPlaces() async {
    // 1. Try to get from cache first
    final cachedData = await _hiveService.getData<List<dynamic>>(_boxName, 'list');
    
    // 2. Fetch from API in background or if cache is empty
    try {
      final remoteData = await _service.fetchNearbyPlaces();
      
      // 3. Update cache
      await _hiveService.putData(_boxName, 'list', remoteData.map((e) => e.toJson()).toList());
      
      return remoteData;
    } catch (e) {
      // 4. Return cached data if API fails
      if (cachedData != null) {
        return cachedData.map((e) => NearbyPlace.fromJson(Map<String, dynamic>.from(e))).toList();
      }
      rethrow;
    }
  }
}

/// Provider for NearbyRepository
final nearbyRepositoryProvider = Provider<NearbyRepository>((ref) {
  final service = ref.watch(nearbyServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return NearbyRepository(service, hiveService);
});
