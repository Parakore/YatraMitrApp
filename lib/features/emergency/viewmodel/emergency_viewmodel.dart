import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/sos_incident.dart';

/// Provider for Emergency state.
final emergencyProvider = StateNotifierProvider<EmergencyViewModel, EmergencyState>((ref) {
  return EmergencyViewModel();
});

class EmergencyState {
  final bool isSosActive;
  final String? lastLocation;
  final List<Map<String, String>> emergencyContacts;
  final List<SosIncident> recentIncidents;
  final List<EmergencyWorkflowStep> workflowSteps;

  EmergencyState({
    required this.isSosActive,
    this.lastLocation,
    required this.emergencyContacts,
    required this.recentIncidents,
    required this.workflowSteps,
  });

  EmergencyState copyWith({
    bool? isSosActive,
    String? lastLocation,
    List<Map<String, String>>? emergencyContacts,
    List<SosIncident>? recentIncidents,
    List<EmergencyWorkflowStep>? workflowSteps,
  }) {
    return EmergencyState(
      isSosActive: isSosActive ?? this.isSosActive,
      lastLocation: lastLocation ?? this.lastLocation,
      emergencyContacts: emergencyContacts ?? this.emergencyContacts,
      recentIncidents: recentIncidents ?? this.recentIncidents,
      workflowSteps: workflowSteps ?? this.workflowSteps,
    );
  }
}

class EmergencyViewModel extends StateNotifier<EmergencyState> {
  EmergencyViewModel()
      : super(EmergencyState(
          isSosActive: false,
          emergencyContacts: [
            {'label': 'Ambulance / SDRF', 'number': '112'},
            {'label': 'Kedarnath Medical Camp', 'number': '+91 135-2713600'},
            {'label': 'Tourist Police Helpline', 'number': '1364'},
            {'label': 'Disaster Control Room', 'number': '1070'},
            {'label': 'Emergency Contact (Sanjay Sharma)', 'number': '+91 99XXXXXXXX'},
          ],
          recentIncidents: [
            const SosIncident(
              id: 'SOS-2025-0041',
              pilgrim: 'Meena Devi (F,58)',
              type: 'Medical',
              location: 'Rambara (8.5km)',
              time: '07:22 AM',
              responseTime: '6 mins',
              agency: 'SDRF + Medical',
              status: 'Resolved',
            ),
            const SosIncident(
              id: 'SOS-2025-0040',
              pilgrim: 'Rajesh Gupta (M,66)',
              type: 'Altitude Sickness',
              location: 'Linchauri (11km)',
              time: '06:48 AM',
              responseTime: '8 mins',
              agency: 'Medical Camp',
              status: 'Resolved',
            ),
            const SosIncident(
              id: 'SOS-2025-0039',
              pilgrim: 'Priya Singh (F,34)',
              type: 'Ankle Injury',
              location: 'Bhimbali (5km)',
              time: '14:10',
              responseTime: '11 mins',
              agency: 'Porter + Medical',
              status: 'Resolved',
            ),
            const SosIncident(
              id: 'SOS-2025-0038',
              pilgrim: 'Deepak Verma (M,55)',
              type: 'Chest Pain',
              location: 'Gaurikund Base',
              time: '09:30',
              responseTime: '4 mins',
              agency: 'Ambulance + AIIMS',
              status: 'Resolved',
            ),
          ],
          workflowSteps: [
            const EmergencyWorkflowStep(title: 'SOS Triggered', icon: '📱', desc: 'Location + Profile auto-shared'),
            const EmergencyWorkflowStep(title: 'AI Classification', icon: '🤖', desc: 'Medical / Accident / Disaster'),
            const EmergencyWorkflowStep(title: 'Unit Dispatched', icon: '🚑', desc: 'Ambulance / Police / SDRF'),
            const EmergencyWorkflowStep(title: 'Live Tracking', icon: '📡', desc: 'Real-time rescue team map'),
            const EmergencyWorkflowStep(title: 'Treatment / Rescue', icon: '🏥', desc: 'Hospital notified en route'),
            const EmergencyWorkflowStep(title: 'Case Closure', icon: '✅', desc: 'Report + feedback loop'),
          ],
        ));

  void triggerSos() {
    state = state.copyWith(
      isSosActive: true,
      lastLocation: 'Lat: 30.7352, Long: 79.0669',
      workflowSteps: state.workflowSteps.asMap().entries.map((e) {
        if (e.key <= 1) return e.value.copyWith(active: true);
        return e.value;
      }).toList(),
    );
  }

  void cancelSos() {
    state = state.copyWith(
      isSosActive: false,
      workflowSteps: state.workflowSteps.map((e) => e.copyWith(active: false)).toList(),
    );
  }
}
