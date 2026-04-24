import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatramitra/core/network/dio_client.dart';

class WeatherService {
  final DioClient _dioClient;
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  WeatherService(this._dioClient);

  Future<Map<String, dynamic>> fetchForecast({
    required double lat,
    required double lon,
  }) async {
    final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
    if (apiKey == null) {
      throw Exception('OpenWeather API Key not found in .env');
    }

    try {
      final response = await _dioClient.get(
        '$_baseUrl/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': apiKey,
          'units': 'metric',
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchCurrentWeather({
    required double lat,
    required double lon,
  }) async {
    final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
    if (apiKey == null) {
      throw Exception('OpenWeather API Key not found in .env');
    }

    try {
      final response = await _dioClient.get(
        '$_baseUrl/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': apiKey,
          'units': 'metric',
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

final weatherServiceProvider = Provider<WeatherService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return WeatherService(dioClient);
});
