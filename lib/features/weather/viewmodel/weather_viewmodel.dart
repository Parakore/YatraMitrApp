import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/weather_models.dart';
import '../repository/weather_repository.dart';
import '../../../core/constants/app_constants.dart';

class WeatherLocation {
  final String name;
  final double lat;
  final double lon;

  const WeatherLocation({required this.name, required this.lat, required this.lon});
}

final charDhamLocations = [
  const WeatherLocation(name: 'Kedarnath', lat: AppConstants.kedarnathLat, lon: AppConstants.kedarnathLon),
  const WeatherLocation(name: 'Badrinath', lat: AppConstants.badrinathLat, lon: AppConstants.badrinathLon),
  const WeatherLocation(name: 'Yamunotri', lat: AppConstants.yamunotriLat, lon: AppConstants.yamunotriLon),
  const WeatherLocation(name: 'Gangotri', lat: AppConstants.gangotriLat, lon: AppConstants.gangotriLon),
];

final selectedWeatherLocationProvider = StateProvider<WeatherLocation>((ref) => charDhamLocations[0]);

class WeatherViewModel extends AsyncNotifier<WeatherIntelligence> {
  @override
  Future<WeatherIntelligence> build() async {
    final location = ref.watch(selectedWeatherLocationProvider);
    return fetchWeather(lat: location.lat, lon: location.lon, name: location.name);
  }

  Future<WeatherIntelligence> fetchWeather({
    required double lat,
    required double lon,
    String? name,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(weatherRepositoryProvider);
      final intelligence = await repository.getWeatherIntelligence(
        lat: lat, 
        lon: lon,
        locationName: name,
      );
      state = AsyncValue.data(intelligence);
      return intelligence;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    final location = ref.read(selectedWeatherLocationProvider);
    await fetchWeather(lat: location.lat, lon: location.lon, name: location.name);
  }

  void setLocation(WeatherLocation location) {
    ref.read(selectedWeatherLocationProvider.notifier).state = location;
  }
}

final weatherViewModelProvider = AsyncNotifierProvider<WeatherViewModel, WeatherIntelligence>(() {
  return WeatherViewModel();
});
