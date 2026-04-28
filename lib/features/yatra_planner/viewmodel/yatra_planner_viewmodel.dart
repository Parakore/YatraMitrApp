import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/yatra_plan.dart';
import '../repository/yatra_planner_repository.dart';
import '../service/itinerary_generator.dart';
import 'package:uuid/uuid.dart';

part 'yatra_planner_viewmodel.g.dart';

/// State class for the Yatra Planner.
class YatraPlannerState {
  final List<YatraPlan> plans;
  final bool isGenerating;
  final int workflowStep; // 0 to 6
  final String? error;

  YatraPlannerState({
    required this.plans,
    this.isGenerating = false,
    this.workflowStep = 0,
    this.error,
  });

  YatraPlannerState copyWith({
    List<YatraPlan>? plans,
    bool? isGenerating,
    int? workflowStep,
    String? error,
  }) {
    return YatraPlannerState(
      plans: plans ?? this.plans,
      isGenerating: isGenerating ?? this.isGenerating,
      workflowStep: workflowStep ?? this.workflowStep,
      error: error ?? this.error,
    );
  }
}

/// ViewModel for managing high-fidelity Yatra plans.
@riverpod
class YatraPlannerViewModel extends _$YatraPlannerViewModel {
  @override
  FutureOr<YatraPlannerState> build() async {
    final repository = ref.watch(yatraPlannerRepositoryProvider);
    final plans = await repository.getPlans();
    return YatraPlannerState(plans: plans);
  }

  /// Generates an AI itinerary following the 6-step workflow.
  Future<void> generateItinerary({
    required String dhamName,
    required DateTime startDate,
    required int durationDays,
    required String startFrom,
    required List<String> dhamsToCover,
    required String ageGroup,
    required String fitnessLevel,
    required String accommodationType,
    required String budgetRange,
    String? specialNeeds,
  }) async {
    state = AsyncData(state.value!.copyWith(isGenerating: true, workflowStep: 1));
    
    try {
      // Simulate the 6-step workflow with delays
      for (int i = 2; i <= 6; i++) {
        await Future.delayed(const Duration(milliseconds: 800));
        state = AsyncData(state.value!.copyWith(workflowStep: i));
      }

      final repository = ref.read(yatraPlannerRepositoryProvider);
      
      final basePlan = YatraPlan(
        id: const Uuid().v4(),
        dhamName: dhamName,
        startDate: startDate,
        durationDays: durationDays,
        startFrom: startFrom,
        dhamsToCover: dhamsToCover,
        ageGroup: ageGroup,
        fitnessLevel: fitnessLevel,
        accommodationType: accommodationType,
        budgetRange: budgetRange,
        specialNeeds: specialNeeds,
        createdAt: DateTime.now(),
      );

      final itinerary = ItineraryGenerator.generate(basePlan);
      final finalPlan = basePlan.copyWith(itinerary: itinerary);

      await repository.savePlan(finalPlan);
      
      final updatedPlans = await repository.getPlans();
      state = AsyncData(YatraPlannerState(plans: updatedPlans, isGenerating: false, workflowStep: 0));
    } catch (e) {
      state = AsyncData(state.value!.copyWith(isGenerating: false, workflowStep: 0, error: e.toString()));
    }
  }

  /// Deletes an existing plan.
  Future<void> removePlan(String id) async {
    try {
      final repository = ref.read(yatraPlannerRepositoryProvider);
      await repository.deletePlan(id);
      
      final updatedPlans = await repository.getPlans();
      state = AsyncData(YatraPlannerState(plans: updatedPlans));
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
