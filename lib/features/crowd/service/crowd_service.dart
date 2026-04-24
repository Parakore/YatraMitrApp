/// Service for fetching crowd intelligence and traffic data.
class CrowdService {
  Future<List<Map<String, dynamic>>> fetchCrowdData() async {
    // Mocking API call delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        'locationId': 'kedarnath_temple',
        'locationName': 'Kedarnath Temple',
        'density': 'high',
        'waitTime': '4-5 Hours',
        'suggestedTime': '4:00 AM',
        'currentCount': 4200,
        'maxCapacity': 5000,
        'trafficLevel': 'Heavy',
      },
      {
        'locationId': 'gaurikund',
        'locationName': 'Gaurikund Base',
        'density': 'moderate',
        'waitTime': '30-45 Mins',
        'suggestedTime': '2:00 PM',
        'currentCount': 1200,
        'maxCapacity': 3000,
        'trafficLevel': 'Moderate',
      },
      {
        'locationId': 'bhairav_temple',
        'locationName': 'Bhairav Temple',
        'density': 'low',
        'waitTime': '10-15 Mins',
        'suggestedTime': 'Anytime',
        'currentCount': 150,
        'maxCapacity': 1000,
        'trafficLevel': 'Clear',
      },
    ];
  }
}
