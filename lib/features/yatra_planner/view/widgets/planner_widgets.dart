import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/status_pill.dart';

/// Standardized field container for preferences.
class PreferenceField extends StatelessWidget {
  final String label;
  final Widget child;
  final IconData icon;
  final VoidCallback? onTap;

  const PreferenceField({
    super.key,
    required this.label,
    required this.child,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(label,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

/// A status pill for indicating risk levels.
class RiskPill extends StatelessWidget {
  final String level;

  const RiskPill({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    final type = _getType();
    final icon = _getIcon();

    return StatusPill(
      label: level.toUpperCase(),
      type: type,
      icon: icon,
    );
  }

  StatusType _getType() {
    switch (level.toLowerCase()) {
      case 'low':
        return StatusType.safe;
      case 'medium':
      case 'moderate':
        return StatusType.warning;
      case 'high':
        return StatusType.danger;
      default:
        return StatusType.info;
    }
  }

  IconData _getIcon() {
    switch (level.toLowerCase()) {
      case 'low':
        return Icons.check_circle_rounded;
      case 'medium':
      case 'moderate':
        return Icons.warning_rounded;
      case 'high':
        return Icons.dangerous_rounded;
      default:
        return Icons.info_rounded;
    }
  }
}

/// Reusable primary button for the planner.
class PlannerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const PlannerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isPrimary
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.saffron,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade200),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary)),
            ),
    );
  }
}

/// A chip-like display for preference summaries.
class PreferenceSummaryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const PreferenceSummaryChip({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.saffron),
          const SizedBox(width: 6),
          Text(label,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
