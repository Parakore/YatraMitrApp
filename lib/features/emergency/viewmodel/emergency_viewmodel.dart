import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/sos_incident.dart';
import '../repository/emergency_repository.dart';

/// Provider for Emergency state.
final emergencyProvider = StateNotifierProvider<EmergencyViewModel, EmergencyState>((ref) {
  final repository = ref.watch(emergencyRepositoryProvider);
  return EmergencyViewModel(repository)..init();
});

class EmergencyState {
  final bool isSosActive;
  final bool isLoading;
  final String? lastLocation;
  final String? selectedCategory;
  final List<Map<String, String>> emergencyContacts;
  final List<SosIncident> recentIncidents;
  final List<EmergencyWorkflowStep> workflowSteps;

  EmergencyState({
    required this.isSosActive,
    this.isLoading = false,
    this.lastLocation,
    this.selectedCategory,
    required this.emergencyContacts,
    required this.recentIncidents,
    required this.workflowSteps,
  });

  EmergencyState copyWith({
    bool? isSosActive,
    bool? isLoading,
    String? lastLocation,
    String? selectedCategory,
    List<Map<String, String>>? emergencyContacts,
    List<SosIncident>? recentIncidents,
    List<EmergencyWorkflowStep>? workflowSteps,
  }) {
    return EmergencyState(
      isSosActive: isSosActive ?? this.isSosActive,
      isLoading: isLoading ?? this.isLoading,
      lastLocation: lastLocation ?? this.lastLocation,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      emergencyContacts: emergencyContacts ?? this.emergencyContacts,
      recentIncidents: recentIncidents ?? this.recentIncidents,
      workflowSteps: workflowSteps ?? this.workflowSteps,
    );
  }
}

class EmergencyViewModel extends StateNotifier<EmergencyState> {
  final EmergencyRepository _repository;

  EmergencyViewModel(this._repository)
      : super(EmergencyState(
          isSosActive: false,
          isLoading: true,
          emergencyContacts: [],
          recentIncidents: [],
          workflowSteps: [],
        ));

  /// Initialize state by fetching data from repository.
  Future<void> init() async {
    try {
      final contacts = await _repository.fetchEmergencyContacts();
      final incidents = await _repository.fetchRecentIncidents();
      final steps = await _repository.fetchWorkflowSteps();

      state = state.copyWith(
        isLoading: false,
        emergencyContacts: contacts,
        recentIncidents: incidents,
        workflowSteps: steps,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle error (Rule 8: Use Failure pattern if needed)
    }
  }

  void setCategory(String category) {
    if (state.selectedCategory == category) {
      state = state.copyWith(selectedCategory: null);
    } else {
      state = state.copyWith(selectedCategory: category);
    }
  }

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
      selectedCategory: null,
      workflowSteps: state.workflowSteps.map((e) => e.copyWith(active: false)).toList(),
    );
  }
}
