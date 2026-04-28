import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/yatra_card.dart';
import '../../../../shared/widgets/yatra_section_header.dart';
import '../../viewmodel/yatra_planner_viewmodel.dart';
import '../../model/yatra_plan.dart';
import 'planner_widgets.dart';

/// The entry point dashboard for the Yatra Planner.
class PlannerDashboardView extends ConsumerWidget {
  final YatraPlannerState state;

  const PlannerDashboardView({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestPlan = state.plans.isNotEmpty ? state.plans.first : null;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: _UserProfileHeader(),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _PlannerActionCard(onPressed: () {
              ref
                  .read(yatraPlannerViewModelProvider.notifier)
                  .setView(PlannerView.preferences);
            }),
          ),
          const YatraSectionHeader(title: 'AI Planning Workflow'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _WorkflowOverview(),
          ),
          if (latestPlan != null) ...[
            YatraSectionHeader(
              title: 'Yatra Preferences',
              onActionPressed: () => ref
                  .read(yatraPlannerViewModelProvider.notifier)
                  .setView(PlannerView.preferences),
              actionLabel: 'Edit',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _PreferencesSummary(plan: latestPlan),
            ),
            YatraSectionHeader(
              title: 'Itinerary Preview',
              onActionPressed: () => ref
                  .read(yatraPlannerViewModelProvider.notifier)
                  .setView(PlannerView.itinerary),
              actionLabel: 'View All',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Your optimized journey is ready.',
                  style:
                      TextStyle(fontSize: 14, color: AppColors.textSecondary)),
            ),
          ] else
            const Padding(
              padding: EdgeInsets.all(20),
              child: _EmptyPlannerState(),
            ),
        ],
      ),
    );
  }
}

class _UserProfileHeader extends StatelessWidget {
  const _UserProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.saffron.withValues(alpha: 0.1),
          child: const Icon(Icons.person_rounded, color: AppColors.saffron),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Namaste, Pilgrim',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
            Text('John Doe',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class _PlannerActionCard extends StatelessWidget {
  final VoidCallback onPressed;

  const _PlannerActionCard({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return YatraCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AI Smart Yatra Planner',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Optimized for safety & comfort',
                  style:
                      TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.saffron.withValues(alpha: 0.1),
              foregroundColor: AppColors.saffron,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Plan Now',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class _WorkflowOverview extends StatelessWidget {
  const _WorkflowOverview();

  @override
  Widget build(BuildContext context) {
    final steps = [
      'Reg. & Profile',
      'Health Screening',
      'AI Route Optimization',
      'Crowd & Weather',
      'Booking & Confirm',
      'Live Tracking'
    ];

    return YatraCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(steps.length, (index) {
          final isCompleted = index < 4;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:
                        isCompleted ? AppColors.saffron : Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : Text('${index + 1}',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey)),
                  ),
                ),
                const SizedBox(width: 12),
                Text(steps[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: isCompleted ? AppColors.textPrimary : Colors.grey,
                      fontWeight:
                          isCompleted ? FontWeight.bold : FontWeight.normal,
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _PreferencesSummary extends ConsumerWidget {
  final YatraPlan plan;

  const _PreferencesSummary({required this.plan});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        PreferenceSummaryChip(
            icon: Icons.calendar_today_rounded,
            label: DateFormat('dd MMM').format(plan.startDate)),
        PreferenceSummaryChip(
            icon: Icons.access_time_rounded,
            label: '${plan.durationDays} Days'),
        PreferenceSummaryChip(
            icon: Icons.location_on_rounded, label: plan.startFrom),
        PreferenceSummaryChip(
            icon: Icons.people_alt_rounded, label: plan.ageGroup),
        PreferenceSummaryChip(
            icon: Icons.favorite_rounded, label: plan.fitnessLevel),
      ],
    );
  }
}

class _EmptyPlannerState extends ConsumerWidget {
  const _EmptyPlannerState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Icon(Icons.calendar_today_outlined,
              size: 48, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text('No active yatra plan found.',
              style: TextStyle(color: AppColors.textSecondary)),
          const SizedBox(height: 24),
          PlannerButton(
              text: 'Plan New Yatra',
              onPressed: () {
                ref
                    .read(yatraPlannerViewModelProvider.notifier)
                    .setView(PlannerView.preferences);
              }),
        ],
      ),
    );
  }
}
