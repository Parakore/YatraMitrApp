import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/weather_models.dart';
import '../repository/weather_repository.dart';

class WeatherViewModel extends AsyncNotifier<WeatherIntelligence> {
  @override
  Future<WeatherIntelligence> build() async {
    // Default to Kedarnath coordinates
    return fetchWeather(lat: 30.7346, lon: 79.0669);
  }

  Future<WeatherIntelligence> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(weatherRepositoryProvider);
      final intelligence = await repository.getWeatherIntelligence(lat: lat, lon: lon);
      state = AsyncValue.data(intelligence);
      return intelligence;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    // Current default or last fetched location
    await fetchWeather(lat: 30.7346, lon: 79.0669);
  }
}

final weatherViewModelProvider = AsyncNotifierProvider<WeatherViewModel, WeatherIntelligence>(() {
  return WeatherViewModel();
});
