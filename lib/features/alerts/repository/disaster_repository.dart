import '../model/disaster_alert.dart';
import '../service/disaster_service.dart';

class DisasterRepository {
  final DisasterService _service;

  DisasterRepository(this._service);

  Future<List<DisasterAlert>> getActiveAlerts() async {
    final rawData = await _service.fetchAlerts();
    return rawData.map((json) => DisasterAlert.fromJson(json)).toList();
  }

  Future<Map<String, dynamic>> getWeather() async {
    return _service.fetchWeatherForecast();
  }
}
