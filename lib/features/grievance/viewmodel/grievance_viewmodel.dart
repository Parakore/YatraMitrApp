import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../model/grievance_model.dart';

class GrievanceState {
  final List<Grievance> grievances;
  final List<GrievanceCategory> categories;
  final bool isLoading;
  final String? pickedImagePath;

  GrievanceState({
    this.grievances = const [],
    this.categories = const [],
    this.isLoading = false,
    this.pickedImagePath,
  });

  GrievanceState copyWith({
    List<Grievance>? grievances,
    List<GrievanceCategory>? categories,
    bool? isLoading,
    String? pickedImagePath,
  }) {
    return GrievanceState(
      grievances: grievances ?? this.grievances,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      pickedImagePath: pickedImagePath ?? this.pickedImagePath,
    );
  }
}

class GrievanceViewModel extends StateNotifier<GrievanceState> {
  GrievanceViewModel() : super(GrievanceState()) {
    _loadInitialData();
  }

  void _loadInitialData() {
    final categories = [
      const GrievanceCategory(
        name: 'Sanitation',
        icon: Icons.delete_outline_rounded,
        color: Colors.green,
      ),
      const GrievanceCategory(
        name: 'Medical',
        icon: Icons.medical_services_outlined,
        color: Colors.red,
      ),
      const GrievanceCategory(
        name: 'Overcharging',
        icon: Icons.payments_outlined,
        color: Colors.amber,
      ),
      const GrievanceCategory(
        name: 'Road Block',
        icon: Icons.traffic_outlined,
        color: Colors.orange,
      ),
      const GrievanceCategory(
        name: 'Water Supply',
        icon: Icons.water_drop_outlined,
        color: Colors.blue,
      ),
      const GrievanceCategory(
        name: 'Security',
        icon: Icons.security_outlined,
        color: Colors.indigo,
      ),
    ];

    final dummyGrievances = [
      Grievance(
        id: 'GRV-2025-0481',
        category: 'Sanitation',
        description: 'Toilet at Rambara rest stop non-functional',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        status: GrievanceStatus.inProgress,
        geoTag: 'Rambara (8.5 km)',
        department: 'SDMC',
        sla: '6 hrs remaining',
      ),
      Grievance(
        id: 'GRV-2025-0442',
        category: 'Overcharging',
        description: 'Horse operator charged ₹800 extra at Gaurikund',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        status: GrievanceStatus.resolved,
        geoTag: 'Gaurikund Gate',
        department: 'Tourist Police',
        sla: 'Resolved ✓',
      ),
    ];

    state = state.copyWith(
      categories: categories,
      grievances: dummyGrievances,
    );
  }

  Future<void> submitGrievance(String category, String description) async {
    state = state.copyWith(isLoading: true);

    // Step 1: Submit + Geo Tag (Simulated)
    final newGrievance = Grievance(
      id: 'GRV-2025-${(1000 + state.grievances.length)}',
      category: category,
      description: description,
      timestamp: DateTime.now(),
      status: GrievanceStatus.pending,
      geoTag: 'Current Location (Auto)',
      photoUrl: state.pickedImagePath,
    );

    state = state.copyWith(
      grievances: [newGrievance, ...state.grievances],
    );

    // Step 2: AI Dept. Allocation Simulation
    await Future.delayed(const Duration(seconds: 2));

    final updatedGrievance = newGrievance.copyWith(
      status: GrievanceStatus.allocating,
      department: _assignDepartment(category),
    );

    state = state.copyWith(
      grievances: state.grievances
          .map((g) => g.id == newGrievance.id ? updatedGrievance : g)
          .toList(),
    );

    // Step 3: SLA Started
    await Future.delayed(const Duration(seconds: 1));

    final slaGrievance = updatedGrievance.copyWith(
      status: GrievanceStatus.inProgress,
      sla: '12 hrs remaining',
    );

    state = state.copyWith(
      grievances: state.grievances
          .map((g) => g.id == newGrievance.id ? slaGrievance : g)
          .toList(),
      isLoading: false,
      pickedImagePath: null, // Clear after success
    );
  }

  void setPickedImage(String? path) {
    state = state.copyWith(pickedImagePath: path);
  }

  String _assignDepartment(String category) {
    switch (category) {
      case 'Sanitation':
        return 'SDMC';
      case 'Medical':
        return 'Health Dept';
      case 'Overcharging':
        return 'Tourist Police';
      case 'Road Block':
        return 'NHAI / BRO';
      case 'Water Supply':
        return 'Jal Sansthan';
      default:
        return 'District Admin';
    }
  }
}

final grievanceViewModelProvider =
    StateNotifierProvider<GrievanceViewModel, GrievanceState>((ref) {
  return GrievanceViewModel();
});
