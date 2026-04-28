import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/status_pill.dart';
import '../viewmodel/crowd_viewmodel.dart';
import '../model/crowd_status.dart';
import '../../../shared/widgets/yatra_app_bar.dart';
import '../../../shared/widgets/yatra_section_header.dart';

class CrowdIntelligenceScreen extends ConsumerWidget {
  const CrowdIntelligenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crowdState = ref.watch(crowdViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: YatraAppBar(
        title: 'Crowd Intelligence',
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(crowdViewModelProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
          ),
        ],
      ),
      body: crowdState.when(
        data: (data) => SingleChildScrollView(
          child: _buildContent(context, data),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<CrowdStatus> data) {
    final totalCount = data.fold(0, (sum, item) => sum + item.currentCount);
    final totalCapacity = data.fold(0, (sum, item) => sum + item.maxCapacity);
    final avgDensity =
        totalCapacity > 0 ? (totalCount / totalCapacity) * 100.0 : 0.0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKpiGrid(totalCount, totalCapacity, avgDensity),
          const SizedBox(height: 32),
          _buildHeatmap(context),
          const SizedBox(height: 32),
          const YatraSectionHeader(title: 'Live Location Monitoring'),
          const SizedBox(height: 16),
          ...data.map((status) => _buildLocationCard(status)),
          const SizedBox(height: 40),
        ],
      ),
    );
  }


  Widget _buildKpiGrid(int count, int capacity, double density) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: [
        _buildPremiumKpi(
          'TOTAL PILGRIMS',
          count.toString(),
          Icons.groups_rounded,
          AppColors.primary,
          '+12% trend',
        ),
        _buildPremiumKpi(
          'AVG. DENSITY',
          '${density.toStringAsFixed(1)}%',
          Icons.analytics_rounded,
          AppColors.gold,
          'Steady Flow',
        ),
        _buildPremiumKpi(
          'TRAFFIC STATUS',
          'Moderate',
          Icons.traffic_rounded,
          AppColors.teal,
          'Improving',
        ),
        _buildPremiumKpi(
          'WAIT TIME',
          '45m',
          Icons.timer_rounded,
          AppColors.error,
          '-10m change',
        ),
      ],
    );
  }

  Widget _buildPremiumKpi(
      String label, String value, IconData icon, Color color, String trend) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 20),
              Text(
                trend,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeatmap(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: YatraSectionHeader(
                title: 'Route Density Map',
                padding: EdgeInsets.zero,
              ),
            ),
            StatusPill(
              label: 'LIVE FEED',
              type: StatusType.danger,
              icon: Icons.fiber_manual_record,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.blueDark,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3), width: 2),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=1000'),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                _buildHeatOverlay(top: 50, left: 120, color: Colors.red),
                _buildHeatOverlay(top: 110, left: 200, color: Colors.orange),
                _buildHeatOverlay(top: 160, left: 70, color: Colors.yellow),

                // Map Controls Overlay
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.zoom_in_map_rounded,
                            color: Colors.white, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          'INTERACTIVE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7)
                        ],
                      ),
                    ),
                    child: Text(
                      'Kedarnath Base Route Tracking Area',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeatOverlay(
      {required double top, required double left, required Color color}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: 0.4),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(CrowdStatus status) {
    final statusType = _getStatusType(status.density);
    final statusColor = _getStatusColor(statusType);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.location_on_rounded,
                      color: statusColor, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status.locationName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'TRAFFIC: ${status.trafficLevel.toUpperCase()}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                StatusPill(
                  label: status.density.name.toUpperCase(),
                  type: statusType,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.03),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem('WAIT TIME', status.waitTime,
                    Icons.timer_rounded, AppColors.error),
                _buildStatItem('SUGGESTED', status.suggestedTime,
                    Icons.event_available_rounded, AppColors.success),
                _buildStatItem(
                    'CAPACITY',
                    '${((status.currentCount / status.maxCapacity) * 100).toInt()}%',
                    Icons.people_rounded,
                    AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  StatusType _getStatusType(CrowdDensity density) {
    switch (density) {
      case CrowdDensity.low:
        return StatusType.safe;
      case CrowdDensity.moderate:
        return StatusType.warning;
      case CrowdDensity.high:
        return StatusType.danger;
    }
  }

  Color _getStatusColor(StatusType type) {
    switch (type) {
      case StatusType.safe:
        return AppColors.success;
      case StatusType.warning:
        return AppColors.warning;
      case StatusType.danger:
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }
}
