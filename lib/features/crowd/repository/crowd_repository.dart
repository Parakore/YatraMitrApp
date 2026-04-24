import '../model/crowd_status.dart';
import '../service/crowd_service.dart';

/// Repository for managing crowd intelligence data.
class CrowdRepository {
  final CrowdService _service;

  CrowdRepository(this._service);

  Future<List<CrowdStatus>> getCrowdIntelligence() async {
    try {
      final rawData = await _service.fetchCrowdData();
      return rawData.map((json) => CrowdStatus.fromJson(json)).toList();
    } catch (e) {
      // In a real app, fallback to local cache (Hive)
      rethrow;
    }
  }
}
