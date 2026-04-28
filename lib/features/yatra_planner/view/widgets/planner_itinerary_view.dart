import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/yatra_card.dart';
import '../../../../shared/widgets/yatra_section_header.dart';
import '../../model/yatra_plan.dart';
import '../../viewmodel/yatra_planner_viewmodel.dart';
import 'planner_widgets.dart';

/// Comprehensive itinerary display for a generated plan.
class PlannerItineraryView extends ConsumerWidget {
  final YatraPlan plan;

  const PlannerItineraryView({super.key, required this.plan});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YatraSectionHeader(
            title: 'Your Itinerary',
            onActionPressed: () => ref
                .read(yatraPlannerViewModelProvider.notifier)
                .setView(PlannerView.dashboard),
            actionLabel: 'Dashboard',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${plan.dhamName} Journey',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${plan.durationDays} Days • ${plan.startFrom}',
                        style: const TextStyle(
                            color: AppColors.textSecondary, fontSize: 14)),
                  ],
                ),
                const _OptimizedPill(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: plan.itinerary!
                  .map((day) => ItineraryDayCard(day: day))
                  .toList(),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PlannerButton(
              text: 'Re-Generate AI Itinerary',
              onPressed: () {
                ref
                    .read(yatraPlannerViewModelProvider.notifier)
                    .removePlan(plan.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OptimizedPill extends StatelessWidget {
  const _OptimizedPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20)),
      child: const Row(
        children: [
          Icon(Icons.auto_awesome, color: Colors.green, size: 14),
          SizedBox(width: 4),
          Text('AI Optimized',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ItineraryDayCard extends StatelessWidget {
  final YatraDayPlan day;

  const ItineraryDayCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return YatraCard(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                  'Day ${day.dayNumber} • ${DateFormat('dd MMM').format(day.date)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const Spacer(),
              RiskPill(level: day.riskLevel),
            ],
          ),
          const SizedBox(height: 16),
          Text(day.route,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          _TransportInfo(day: day),
          const SizedBox(height: 20),
          _DetailRow(
              icon: Icons.hotel_rounded,
              label: 'Accommodation',
              value: day.accommodation),
          _DetailRow(
              icon: Icons.wb_sunny_rounded,
              label: 'Weather',
              value: day.weather),
          _DetailRow(
            icon: Icons.groups_rounded,
            label: 'Crowd Forecast',
            value: day.crowdForecast,
            isHighlight: true,
          ),
          const Divider(height: 32),
          _AITipSection(tip: day.aiTip),
        ],
      ),
    );
  }
}

class _TransportInfo extends StatelessWidget {
  final YatraDayPlan day;

  const _TransportInfo({required this.day});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.directions_bus_rounded, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Expanded(
          child: Text('${day.distance} • ${day.transport}',
              style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isHighlight;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.saffron),
          const SizedBox(width: 12),
          Text('$label:',
              style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Expanded(
            child: Text(value,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isHighlight
                        ? AppColors.saffron
                        : AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }
}

class _AITipSection extends StatelessWidget {
  final String tip;

  const _AITipSection({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.tips_and_updates_rounded,
            color: AppColors.saffron, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('AI Tip',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text(tip,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    );
  }
}
