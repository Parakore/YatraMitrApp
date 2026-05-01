import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/yatra_plan.dart';
import '../repository/yatra_planner_repository.dart';
import 'package:uuid/uuid.dart';

part 'yatra_planner_viewmodel.g.dart';

enum PlannerView { dashboard, preferences, generating, itinerary }

/// State class for the Yatra Planner.
class YatraPlannerState {
  final List<YatraPlan> plans;
  final bool isGenerating;
  final int workflowStep; // 0 to 6
  final PlannerView view;
  final String? error;

  YatraPlannerState({
    required this.plans,
    this.isGenerating = false,
    this.workflowStep = 0,
    this.view = PlannerView.preferences,
    this.error,
  });

  YatraPlannerState copyWith({
    List<YatraPlan>? plans,
    bool? isGenerating,
    int? workflowStep,
    PlannerView? view,
    String? error,
  }) {
    return YatraPlannerState(
      plans: plans ?? this.plans,
      isGenerating: isGenerating ?? this.isGenerating,
      workflowStep: workflowStep ?? this.workflowStep,
      view: view ?? this.view,
      error: error ?? this.error,
    );
  }
}

/// ViewModel for managing high-fidelity Yatra plans with multi-view support.
@riverpod
class YatraPlannerViewModel extends _$YatraPlannerViewModel {
  @override
  FutureOr<YatraPlannerState> build() async {
    final repository = ref.watch(yatraPlannerRepositoryProvider);
    final plans = await repository.getPlans();
    
    return YatraPlannerState(
      plans: plans,
      view: PlannerView.dashboard,
    );
  }

  /// Switches the current view.
  void setView(PlannerView view) {
    state = AsyncData(state.value!.copyWith(view: view));
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
    state = AsyncData(state.value!.copyWith(
      isGenerating: true, 
      workflowStep: 1,
      view: PlannerView.generating,
    ));
    
    try {
      // Step 1-4: Simulation for UX (Analyzing, Route, Stays, Weather)
      for (int i = 2; i <= 4; i++) {
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
        status: 'Generated',
      );

      // Step 5: Real AI Analysis
      state = AsyncData(state.value!.copyWith(workflowStep: 5));
      final itinerary = await repository.generateAiItinerary(basePlan);
      
      // Step 6: Finalizing Plan
      state = AsyncData(state.value!.copyWith(workflowStep: 6));
      await Future.delayed(const Duration(milliseconds: 500));
      
      final finalPlan = basePlan.copyWith(itinerary: itinerary);

      await repository.savePlan(finalPlan);
      
      final updatedPlans = await repository.getPlans();
      state = AsyncData(YatraPlannerState(
        plans: updatedPlans, 
        isGenerating: false, 
        workflowStep: 0,
        view: PlannerView.dashboard,
      ));
    } catch (e) {
      state = AsyncData(state.value!.copyWith(
        isGenerating: false, 
        workflowStep: 0, 
        error: e.toString(),
        view: PlannerView.preferences,
      ));
    }
  }

  /// Deletes an existing plan.
  Future<void> removePlan(String id) async {
    try {
      final repository = ref.read(yatraPlannerRepositoryProvider);
      await repository.deletePlan(id);
      
      final updatedPlans = await repository.getPlans();
      state = AsyncData(YatraPlannerState(
        plans: updatedPlans,
        view: updatedPlans.isNotEmpty ? PlannerView.dashboard : PlannerView.preferences,
      ));
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
