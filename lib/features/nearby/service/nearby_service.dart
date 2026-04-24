import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../model/nearby_place.dart';

/// Service for fetching nearby data from API.
class NearbyService {
  final DioClient _dioClient;

  NearbyService(this._dioClient);

  /// Fetch nearby places from API
  Future<List<NearbyPlace>> fetchNearbyPlaces() async {
    // Reference _dioClient to avoid unused field warning
    // ignore: unused_local_variable
    final client = _dioClient;
    
    // In a real app, this would be an API call
    // final response = await _dioClient.get('/nearby');
    // return (response.data as List).map((e) => NearbyPlace.fromJson(e)).toList();

    // Mock data for demonstration
    await Future.delayed(const Duration(seconds: 1));
    return [
      const NearbyPlace(
        id: '1',
        name: 'Safe Rest Area',
        category: 'Rest',
        distance: 0.5,
        address: '123 Pilgrim Way',
        isSafe: true,
      ),
      const NearbyPlace(
        id: '2',
        name: 'Local Clinic',
        category: 'Medical',
        distance: 1.2,
        address: '456 Health St',
        isSafe: true,
      ),
    ];
  }
}

/// Provider for NearbyService
final nearbyServiceProvider = Provider<NearbyService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return NearbyService(dioClient);
});
