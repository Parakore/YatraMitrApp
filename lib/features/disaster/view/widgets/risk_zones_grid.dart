import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/disaster_models.dart';

class RiskZonesGrid extends StatelessWidget {
  final List<LandslideZone> zones;
  const RiskZonesGrid({super.key, required this.zones});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: zones.length,
        itemBuilder: (context, index) {
          final zone = zones[index];
          return _buildZoneCard(zone);
        },
      ),
    );
  }

  Widget _buildZoneCard(LandslideZone zone) {
    Color riskColor;
    IconData riskIcon;
    switch (zone.riskLevel) {
      case 'High':
        riskColor = AppColors.error;
        riskIcon = Icons.report_problem_rounded;
        break;
      case 'Medium':
        riskColor = AppColors.warning;
        riskIcon = Icons.warning_amber_rounded;
        break;
      case 'Low':
        riskColor = AppColors.success;
        riskIcon = Icons.check_circle_outline_rounded;
        break;
      default:
        riskColor = Colors.grey;
        riskIcon = Icons.help_outline_rounded;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: riskColor.withAlpha(50), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: riskColor.withAlpha(20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: riskColor.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: Icon(riskIcon, color: riskColor, size: 20),
          ),
          const Spacer(),
          Text(
            zone.location,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: riskColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '${zone.riskLevel} Risk',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: riskColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            zone.status,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
