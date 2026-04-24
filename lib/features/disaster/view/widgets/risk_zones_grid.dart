import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/kpi_card.dart';
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
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.4,
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
    switch (zone.riskLevel) {
      case 'High':
        riskColor = AppColors.error;
        break;
      case 'Medium':
        riskColor = AppColors.warning;
        break;
      case 'Low':
        riskColor = AppColors.success;
        break;
      default:
        riskColor = Colors.grey;
    }

    return KpiCard(
      label: zone.location,
      value: zone.riskLevel,
      trendLabel: 'Status: ${zone.status}',
      borderColor: riskColor,
    );
  }
}
