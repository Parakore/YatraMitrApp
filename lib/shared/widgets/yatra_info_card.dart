import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// A versatile information card for alerts, recommendations, and tips.
/// 
/// Designed with high contrast and accessibility in mind, supporting
/// different severity levels (High, Medium, Low) with corresponding colors.
class YatraInfoCard extends StatelessWidget {
  /// The title or category of the information.
  final String title;

  /// The main message or content of the card.
  final String content;

  /// The icon to display on the left.
  final IconData icon;

  /// Severity level which determines the color scheme.
  /// Options: 'High' (Error/Red), 'Medium' (Warning/Amber), 'Low' (Success/Green).
  final String severity;

  /// Optional list of bullet points or tips to display below the content.
  final List<String>? bulletPoints;

  const YatraInfoCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    this.severity = 'Low',
    this.bulletPoints,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (severity) {
      case 'High':
        statusColor = AppColors.error;
        break;
      case 'Medium':
        statusColor = AppColors.warning;
        break;
      default:
        statusColor = AppColors.success;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: statusColor.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor.withAlpha(50), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: statusColor, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (bulletPoints != null && bulletPoints!.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 12),
            ...bulletPoints!.map((tip) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Icon(Icons.circle, size: 6, color: statusColor),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tip,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }
}
