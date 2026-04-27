import 'package:flutter/material.dart';
import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:yatramitra/features/emergency/model/sos_incident.dart';

class WorkflowTracker extends StatelessWidget {
  final List<EmergencyWorkflowStep> steps;

  const WorkflowTracker({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            'SOS RESCUE WORKFLOW',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final step = steps[index];
              return _buildWorkflowCard(step, index == steps.length - 1);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWorkflowCard(EmergencyWorkflowStep step, bool isLast) {
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: step.active ? AppColors.primary.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: step.active
              ? AppColors.primary.withOpacity(0.3)
              : Colors.grey.shade200,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: step.active ? AppColors.primary : Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Text(
              step.icon,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 12,
              color: step.active ? AppColors.primary : AppColors.secondary,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              step.desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
