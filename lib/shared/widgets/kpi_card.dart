import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// A card for displaying key performance indicators (KPIs).
/// Matches the .kpi-card style from the web prototype.
class KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final String? trendLabel;
  final bool isTrendUp;
  final Color borderColor;

  const KpiCard({
    super.key,
    required this.label,
    required this.value,
    this.trendLabel,
    this.isTrendUp = true,
    this.borderColor = AppColors.saffron,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border(
          left: BorderSide(color: borderColor, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
          if (trendLabel != null) ...[
            const SizedBox(height: 4),
            Text(
              trendLabel!,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isTrendUp ? AppColors.success : AppColors.error,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
