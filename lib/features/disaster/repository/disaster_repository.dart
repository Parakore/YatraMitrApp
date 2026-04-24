import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/disaster_models.dart';
import '../service/disaster_service.dart';

/// Repository for handling disaster intelligence data.
/// Acts as an abstraction layer between ViewModel and Service.
class DisasterRepository {
  final DisasterService _disasterService;

  DisasterRepository(this._disasterService);

  /// Get the complete disaster intelligence summary
  Future<DisasterIntelligenceSummary> getDisasterSummary() async {
    try {
      return await _disasterService.fetchDisasterSummary();
    } catch (e) {
      rethrow;
    }
  }
}

/// Provider for DisasterRepository
final disasterRepositoryProvider = Provider<DisasterRepository>((ref) {
  final disasterService = ref.watch(disasterServiceProvider);
  return DisasterRepository(disasterService);
});
