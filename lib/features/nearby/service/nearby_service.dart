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

    // Mock data based on user requirements
    await Future.delayed(const Duration(seconds: 1));
    return [
      const NearbyPlace(
        id: '1',
        name: 'Govt Toilet Complex',
        category: 'Toilets',
        distanceInfo: '150m',
        address: 'Gaurikund Main',
        subInfo: 'Open 24×7',
        statusTag: 'Cleanliness: Good',
        rating: 4.0,
      ),
      const NearbyPlace(
        id: '2',
        name: 'SBI ATM',
        category: 'ATM',
        distanceInfo: '200m',
        address: 'Near Bus Stand',
        subInfo: '₹10,000 limit',
        statusTag: 'Cash Available',
      ),
      const NearbyPlace(
        id: '3',
        name: 'Aahar Kendra (Govt)',
        category: 'Food',
        distanceInfo: '300m',
        address: 'Gaurikund Market',
        subInfo: 'Hygiene: Certified',
        statusTag: '₹30–80/meal',
        priceRange: '₹30–80',
      ),
      const NearbyPlace(
        id: '4',
        name: 'Medical Camp',
        category: 'Medical',
        distanceInfo: '350m',
        address: 'SDRF Base',
        subInfo: '24×7 Emergency',
        statusTag: 'O₂ Available',
        isSafe: true,
      ),
      const NearbyPlace(
        id: '5',
        name: 'Tourist Rest Bhavan',
        category: 'Rest Area',
        distanceInfo: '500m',
        address: 'GMVN Property',
        subInfo: '₹400/night',
        statusTag: 'Available',
        priceRange: '₹400',
      ),
      const NearbyPlace(
        id: '6',
        name: 'Tourist Police Post',
        category: 'Police',
        distanceInfo: '600m',
        address: 'Near Gaurikund Gate',
        subInfo: '24×7',
        statusTag: 'Staffed',
      ),
      const NearbyPlace(
        id: '7',
        name: 'Drinking Water Point',
        category: 'Water',
        distanceInfo: '700m',
        address: 'Purified Mountain Water',
        subInfo: 'Free',
        statusTag: 'Tested Safe',
      ),
      const NearbyPlace(
        id: '8',
        name: 'Saraswati Pharmacy',
        category: 'Medical', // Or 'Pharmacy' if we add it
        distanceInfo: '850m',
        address: 'Gaurikund Market',
        subInfo: '06:00–21:00',
        statusTag: 'Diamox Available',
      ),
    ];
  }
}

/// Provider for NearbyService
final nearbyServiceProvider = Provider<NearbyService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return NearbyService(dioClient);
});
