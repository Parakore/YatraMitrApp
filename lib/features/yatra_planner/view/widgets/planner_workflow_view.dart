import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Visual display of the 6-step AI generation workflow.
class PlannerWorkflowView extends StatelessWidget {
  final int currentStep;

  const PlannerWorkflowView({super.key, required this.currentStep});

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

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome_rounded,
                size: 64, color: AppColors.saffron),
            const SizedBox(height: 32),
            const Text(
              'AI Planning Workflow',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ...List.generate(steps.length, (index) {
              final stepNum = index + 1;
              final isActive = stepNum <= currentStep;
              return _WorkflowStepItem(
                stepNum: stepNum,
                label: steps[index],
                isActive: isActive,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _WorkflowStepItem extends StatelessWidget {
  final int stepNum;
  final String label;
  final bool isActive;

  const _WorkflowStepItem({
    required this.stepNum,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isActive ? AppColors.saffron : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isActive
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : Text('$stepNum', style: const TextStyle(color: Colors.grey)),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppColors.textPrimary : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
