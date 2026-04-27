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
        subInfo: 'Open 24×7 • Cleanliness: Good',
        statusTag: 'FREE SERVICE',
        rating: 4.5,
      ),
      const NearbyPlace(
        id: '2',
        name: 'SBI ATM (Base Camp)',
        category: 'ATM',
        distanceInfo: '200m',
        address: 'Near Bus Stand, Gaurikund',
        subInfo: '₹10,000 limit per txn',
        statusTag: 'CASH AVAILABLE',
        rating: 3.8,
      ),
      const NearbyPlace(
        id: '3',
        name: 'Aahar Kendra (Govt)',
        category: 'Food',
        distanceInfo: '300m',
        address: 'Gaurikund Market Area',
        subInfo: 'Hygiene: Certified • Veg only',
        statusTag: '₹30–80 / MEAL',
        rating: 4.2,
        priceRange: '₹30–80',
      ),
      const NearbyPlace(
        id: '4',
        name: 'Emergency Medical Camp',
        category: 'Medical',
        distanceInfo: '350m',
        address: 'SDRF Base, Route Entry',
        subInfo: '24×7 Doctors available',
        statusTag: 'O₂ CYLINDERS AVAILABLE',
        rating: 4.9,
        isSafe: true,
      ),
      const NearbyPlace(
        id: '5',
        name: 'Tourist Rest Bhavan',
        category: 'Rest Area',
        distanceInfo: '500m',
        address: 'GMVN Property, Upper Slope',
        subInfo: 'Bed available: 12 left',
        statusTag: '₹400 / NIGHT',
        rating: 4.0,
        priceRange: '₹400',
      ),
      const NearbyPlace(
        id: '6',
        name: 'Tourist Police Post',
        category: 'Police',
        distanceInfo: '600m',
        address: 'Near Gaurikund Gate',
        subInfo: '24×7 Assistance',
        statusTag: 'STAFFED',
        rating: 4.8,
        isSafe: true,
      ),
      const NearbyPlace(
        id: '7',
        name: 'Purified Water Point',
        category: 'Water',
        distanceInfo: '700m',
        address: 'Purified Mountain Water',
        subInfo: 'RO + UV Treated',
        statusTag: 'TESTED SAFE',
        rating: 4.6,
      ),
      const NearbyPlace(
        id: '8',
        name: 'Saraswati Pharmacy',
        category: 'Medical',
        distanceInfo: '850m',
        address: 'Gaurikund Market',
        subInfo: '06:00–21:00 • Medicines',
        statusTag: 'DIAMOX AVAILABLE',
        rating: 4.1,
      ),
      const NearbyPlace(
        id: '9',
        name: 'Kedarnath Post Office',
        category: 'ATM',
        distanceInfo: '950m',
        address: 'Main Town Center',
        subInfo: 'Cash withdrawal available',
        statusTag: 'CASH AVAILABLE',
        rating: 3.5,
      ),
      const NearbyPlace(
        id: '10',
        name: 'Community Kitchen',
        category: 'Food',
        distanceInfo: '1.2km',
        address: 'Near Old Route Entry',
        subInfo: 'Free Langar (Govt)',
        statusTag: 'FREE MEAL',
        rating: 4.7,
      ),
      const NearbyPlace(
        id: '11',
        name: 'Kedarnath Base Hospital',
        category: 'Medical',
        distanceInfo: '1.5km',
        address: 'Base Camp East',
        subInfo: 'ICU & Trauma Center',
        statusTag: 'STAFFED 24/7',
        rating: 4.8,
        isSafe: true,
      ),
      const NearbyPlace(
        id: '12',
        name: 'Mountain Spring Water',
        category: 'Water',
        distanceInfo: '1.8km',
        address: 'Mid-way Point (Rambara)',
        subInfo: 'Natural Filtered Water',
        statusTag: 'DRINKING SAFE',
        rating: 4.4,
      ),
      const NearbyPlace(
        id: '13',
        name: 'PNB ATM',
        category: 'ATM',
        distanceInfo: '2.1km',
        address: 'Near Helicopter Pad',
        statusTag: 'CASH AVAILABLE',
        subInfo: 'Daily limit ₹20k',
        rating: 3.9,
      ),
      const NearbyPlace(
        id: '14',
        name: 'SDRF Medical Point',
        category: 'Medical',
        distanceInfo: '2.5km',
        address: 'Bhimoali Point',
        subInfo: 'First Aid & Oxygen',
        statusTag: 'O₂ AVAILABLE',
        rating: 4.9,
      ),
      const NearbyPlace(
        id: '15',
        name: 'Pilgrim Shelter 4',
        category: 'Rest Area',
        distanceInfo: '2.8km',
        address: 'Jungle Chatti',
        subInfo: 'Basic stay • 20 beds',
        statusTag: '₹200 / PERSON',
        rating: 3.7,
      ),
      const NearbyPlace(
        id: '16',
        name: 'Police Assistance Booth',
        category: 'Police',
        distanceInfo: '3.2km',
        address: 'Rambara Bridge',
        subInfo: 'Help desk for lost/found',
        statusTag: 'ACTIVE',
        rating: 4.5,
      ),
      const NearbyPlace(
        id: '17',
        name: 'High-Altitude Clinic',
        category: 'Medical',
        distanceInfo: '3.5km',
        address: 'Near Temple Precinct',
        subInfo: 'Altitude sickness experts',
        statusTag: 'SPECIALIST CARE',
        rating: 4.9,
      ),
      const NearbyPlace(
        id: '18',
        name: 'Kedarnath Temple Food Hall',
        category: 'Food',
        distanceInfo: '3.8km',
        address: 'Temple South Exit',
        subInfo: 'Pure sattvic meals',
        statusTag: 'CERTIFIED VEG',
        rating: 4.8,
      ),
      const NearbyPlace(
        id: '19',
        name: 'Public Hydration Hub',
        category: 'Water',
        distanceInfo: '4.1km',
        address: 'Temple Courtyard',
        subInfo: 'Chilled RO Water',
        statusTag: 'FREE WATER',
        rating: 4.6,
      ),
      const NearbyPlace(
        id: '20',
        name: 'GMVN Guest House',
        category: 'Rest Area',
        distanceInfo: '4.5km',
        address: 'Temple VIP Block',
        subInfo: 'Premium stay • Pre-booked',
        statusTag: 'FULLY BOOKED',
        rating: 4.3,
      ),
    ];
  }
}

/// Provider for NearbyService
final nearbyServiceProvider = Provider<NearbyService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return NearbyService(dioClient);
});
