import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

enum StatusType { safe, warning, danger, info }

/// A small color-coded pill for status indicators.
/// Inspired by the web prototype's status-pill class.
class StatusPill extends StatelessWidget {
  final String label;
  final IconData? icon;
  final StatusType type;

  const StatusPill({
    super.key,
    required this.label,
    this.icon,
    this.type = StatusType.safe,
  });

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor, borderColor) = _getColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  (Color, Color, Color) _getColors() {
    switch (type) {
      case StatusType.safe:
        return (
          AppColors.success.withAlpha(51), // 0.2 opacity
          AppColors.success,
          AppColors.success.withAlpha(77), // 0.3 opacity
        );
      case StatusType.warning:
        return (
          AppColors.saffron.withAlpha(38), // 0.15 opacity
          AppColors.saffron,
          AppColors.saffron.withAlpha(77),
        );
      case StatusType.danger:
        return (
          AppColors.error.withAlpha(38),
          AppColors.error,
          AppColors.error.withAlpha(77),
        );
      case StatusType.info:
        return (
          AppColors.secondary.withAlpha(38),
          AppColors.secondary,
          AppColors.secondary.withAlpha(77),
        );
    }
  }
}
