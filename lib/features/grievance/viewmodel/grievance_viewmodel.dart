import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../model/grievance_model.dart';

class GrievanceState {
  final List<Grievance> grievances;
  final List<GrievanceCategory> categories;
  final bool isLoading;

  GrievanceState({
    this.grievances = const [],
    this.categories = const [],
    this.isLoading = false,
  });

  GrievanceState copyWith({
    List<Grievance>? grievances,
    List<GrievanceCategory>? categories,
    bool? isLoading,
  }) {
    return GrievanceState(
      grievances: grievances ?? this.grievances,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class GrievanceViewModel extends StateNotifier<GrievanceState> {
  GrievanceViewModel() : super(GrievanceState()) {
    _loadInitialData();
  }

  void _loadInitialData() {
    final categories = [
      GrievanceCategory(
        name: 'Sanitation',
        icon: Icons.delete_outline_rounded,
        color: Colors.green,
      ),
      GrievanceCategory(
        name: 'Medical',
        icon: Icons.medical_services_outlined,
        color: Colors.red,
      ),
      GrievanceCategory(
        name: 'Road Block',
        icon: Icons.traffic_outlined,
        color: Colors.orange,
      ),
      GrievanceCategory(
        name: 'Water Supply',
        icon: Icons.water_drop_outlined,
        color: Colors.blue,
      ),
      GrievanceCategory(
        name: 'Security',
        icon: Icons.security_outlined,
        color: Colors.indigo,
      ),
      GrievanceCategory(
        name: 'Others',
        icon: Icons.more_horiz_rounded,
        color: Colors.grey,
      ),
    ];

    state = state.copyWith(categories: categories);
  }

  Future<void> submitGrievance(String category, String description) async {
    state = state.copyWith(isLoading: true);
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    final newGrievance = Grievance(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      category: category,
      description: description,
      timestamp: DateTime.now(),
    );

    state = state.copyWith(
      grievances: [newGrievance, ...state.grievances],
      isLoading: false,
    );
  }
}

final grievanceViewModelProvider =
    StateNotifierProvider<GrievanceViewModel, GrievanceState>((ref) {
  return GrievanceViewModel();
});
