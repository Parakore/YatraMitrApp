import '../model/yatra_plan.dart';

/// Enhanced service to generate high-fidelity AI itineraries.
class ItineraryGenerator {
  /// Generates a comprehensive day-wise itinerary based on detailed user preferences.
  static List<YatraDayPlan> generate(YatraPlan plan) {
    final List<YatraDayPlan> itinerary = [];
    final bool isKedarnath = plan.dhamsToCover.any((d) => d.toLowerCase().contains('kedarnath'));
    
    // Simulate generation for the duration specified
    for (int i = 1; i <= plan.durationDays; i++) {
      final currentDate = plan.startDate.add(Duration(days: i - 1));
      
      if (isKedarnath) {
        itinerary.add(_generateKedarnathDay(i, currentDate, plan));
      } else {
        itinerary.add(_generateGenericDay(i, currentDate, plan));
      }
    }

    return itinerary;
  }

  static YatraDayPlan _generateKedarnathDay(int day, DateTime date, YatraPlan plan) {
    switch (day) {
      case 1:
        return YatraDayPlan(
          dayNumber: 1,
          date: date,
          route: '${plan.startFrom} → Sonprayag',
          distance: '214 km',
          transport: 'Bus/Taxi',
          accommodation: 'Sonprayag Rest House',
          weather: 'Partly Cloudy',
          crowdForecast: 'Low',
          aiTip: 'Start early (6 AM). Book seat in GMOU bus.',
          riskLevel: 'Low',
        );
      case 2:
        return YatraDayPlan(
          dayNumber: 2,
          date: date,
          route: 'Sonprayag → Gaurikund → Base Camp',
          distance: '5 km trek',
          transport: 'Trek + Horse opt.',
          accommodation: 'UT Camp Gaurikund',
          weather: 'Clear',
          crowdForecast: 'Moderate',
          aiTip: 'Do Gaurikund holy dip in morning. Rest well before Kedarnath trek.',
          riskLevel: 'Moderate',
        );
      case 3:
        return YatraDayPlan(
          dayNumber: 3,
          date: date,
          route: 'Gaurikund → Kedarnath Dham',
          distance: '14 km trek',
          transport: plan.fitnessLevel.contains('High') ? 'Trek / Heli opt.' : 'Pony / Heli opt.',
          accommodation: 'UT Dharamshala Kedarnath',
          weather: 'Rain PM',
          crowdForecast: 'High',
          aiTip: 'Start before 7 AM. Rest at Rambara. Darshan booked for Day 4 morning.',
          riskLevel: 'High',
        );
      default:
        return _generateGenericDay(day, date, plan);
    }
  }

  static YatraDayPlan _generateGenericDay(int day, DateTime date, YatraPlan plan) {
    return YatraDayPlan(
      dayNumber: day,
      date: date,
      route: 'Exploration in ${plan.dhamName}',
      distance: 'Local',
      transport: 'Walking',
      accommodation: '${plan.accommodationType} Stay',
      weather: 'Sunny',
      crowdForecast: 'Moderate',
      aiTip: 'Stay hydrated and carry local currency.',
      riskLevel: 'Low',
    );
  }
}
