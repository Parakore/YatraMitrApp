import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// A standardized section header component for grouping content.
/// 
/// Provides a vertical accent line (saffron) on the left to draw attention
/// and maintains consistent typography across different feature screens.
class YatraSectionHeader extends StatelessWidget {
  /// The title text of the section.
  final String title;

  /// Optional padding around the header.
  final EdgeInsetsGeometry padding;

  /// Whether to capitalize the title. Defaults to true for secondary style.
  final bool capitalize;

  /// Optional callback for a trailing action (e.g., "See All").
  final VoidCallback? onActionPressed;

  /// Label for the trailing action.
  final String? actionLabel;

  const YatraSectionHeader({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.fromLTRB(20, 24, 20, 12),
    this.capitalize = false,
    this.onActionPressed,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.saffron,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              capitalize ? title.toUpperCase() : title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          if (onActionPressed != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(
                actionLabel ?? 'See All',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
