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
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: borderColor.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: borderColor.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.show_chart_rounded, size: 14, color: borderColor),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              letterSpacing: -0.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (trendLabel != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: (isTrendUp ? AppColors.success : AppColors.error).withAlpha(20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                trendLabel!,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: isTrendUp ? AppColors.success : AppColors.error,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
