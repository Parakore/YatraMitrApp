import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/sos_incident.dart';
import '../service/emergency_service.dart';

/// Provider for Emergency Repository
final emergencyRepositoryProvider = Provider((ref) {
  final service = ref.watch(emergencyServiceProvider);
  return EmergencyRepository(service);
});

/// Repository for Emergency feature.
/// Acts as an abstraction layer between ViewModel and Service.
class EmergencyRepository {
  final EmergencyService _service;

  EmergencyRepository(this._service);

  Future<List<Map<String, String>>> fetchEmergencyContacts() {
    return _service.getEmergencyContacts();
  }

  Future<List<SosIncident>> fetchRecentIncidents() {
    return _service.getRecentIncidents();
  }

  Future<List<EmergencyWorkflowStep>> fetchWorkflowSteps() {
    return _service.getWorkflowSteps();
  }
}
