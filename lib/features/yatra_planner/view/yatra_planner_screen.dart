import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/yatra_app_bar.dart';
import '../viewmodel/yatra_planner_viewmodel.dart';
import 'widgets/planner_dashboard_view.dart';
import 'widgets/planner_preferences_view.dart';
import 'widgets/planner_workflow_view.dart';
import 'widgets/planner_itinerary_view.dart';

/// High-fidelity Yatra Planner screen.
/// Entry point for AI-driven itinerary management.
class YatraPlannerScreen extends ConsumerWidget {
  const YatraPlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(yatraPlannerViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const YatraAppBar(title: 'Yatra Planner'),
      body: state.when(
        data: (plannerState) => _PlannerBody(state: plannerState),
        loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.saffron)),
        error: (err, stack) => AppErrorWidget(
          errorMessage: 'Error: $err',
          onRetry: () => ref.invalidate(yatraPlannerViewModelProvider),
        ),
      ),
    );
  }
}

class _PlannerBody extends StatelessWidget {
  final YatraPlannerState state;

  const _PlannerBody({required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.view) {
      case PlannerView.dashboard:
        return PlannerDashboardView(state: state);
      case PlannerView.preferences:
        return PlannerPreferencesView(
          state: state,
        );
      case PlannerView.generating:
        return PlannerWorkflowView(currentStep: state.workflowStep);
      case PlannerView.itinerary:
        final latestPlan = state.plans.isNotEmpty ? state.plans.first : null;
        if (latestPlan != null && latestPlan.itinerary != null) {
          return PlannerItineraryView(plan: latestPlan);
        }
        // Fallback to preferences if itinerary is missing
        return PlannerPreferencesView(
          state: state,
        );
    }
  }
}
