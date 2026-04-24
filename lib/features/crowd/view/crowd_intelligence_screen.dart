import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/kpi_card.dart';
import '../../../shared/widgets/status_pill.dart';
import '../viewmodel/crowd_viewmodel.dart';
import '../model/crowd_status.dart';

class CrowdIntelligenceScreen extends ConsumerWidget {
  const CrowdIntelligenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crowdState = ref.watch(crowdViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crowd Intelligence'),
        actions: [
          IconButton(
            onPressed: () => ref.read(crowdViewModelProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: crowdState.when(
        data: (data) => _buildContent(context, data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<CrowdStatus> data) {
    // Aggregated stats for KPIs
    final totalCount = data.fold(0, (sum, item) => sum + item.currentCount);
    final totalCapacity = data.fold(0, (sum, item) => sum + item.maxCapacity);
    final avgDensity = totalCapacity > 0 ? (totalCount / totalCapacity) * 100.0 : 0.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKpiGrid(totalCount, totalCapacity, avgDensity),
          const SizedBox(height: 24),
          _buildHeatmap(context),
          const SizedBox(height: 24),
          const Text(
            'Live Location Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...data.map((status) => _buildLocationCard(status)),
        ],
      ),
    );
  }

  Widget _buildKpiGrid(int count, int capacity, double density) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        KpiCard(
          label: 'Total Pilgrims',
          value: count.toString(),
          trendLabel: '+12% vs last hour',
          borderColor: AppColors.saffron,
        ),
        KpiCard(
          label: 'Avg. Density',
          value: '${density.toStringAsFixed(1)}%',
          trendLabel: 'Steady',
          borderColor: AppColors.gold,
        ),
        KpiCard(
          label: 'Traffic Status',
          value: 'Moderate',
          trendLabel: 'Improving',
          borderColor: AppColors.teal,
        ),
        KpiCard(
          label: 'Est. Wait Time',
          value: '45m',
          trendLabel: '-10m change',
          borderColor: AppColors.purple,
        ),
      ],
    );
  }

  Widget _buildHeatmap(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Route Density Heatmap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            StatusPill(
              label: 'LIVE',
              type: StatusType.danger,
              icon: Icons.fiber_manual_record,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.blueDark,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=1000'), // Replace with local asset later
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
          ),
          child: Stack(
            children: [
              _buildHeatOverlay(top: 40, left: 100, color: Colors.red),
              _buildHeatOverlay(top: 100, left: 180, color: Colors.orange),
              _buildHeatOverlay(top: 150, left: 50, color: Colors.yellow),
              const Positioned(
                bottom: 12,
                right: 12,
                child: Text(
                  'Kedarnath Base Route',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeatOverlay({required double top, required double left, required Color color}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withAlpha(204),
              color.withAlpha(0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(CrowdStatus status) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status.locationName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Traffic: ${status.trafficLevel}',
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                StatusPill(
                  label: status.density.name.toUpperCase(),
                  type: _getStatusType(status.density),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem('Wait Time', status.waitTime, Icons.timer),
                _buildStatItem('Suggested', status.suggestedTime, Icons.event_available),
                _buildStatItem('Capacity', '${((status.currentCount / status.maxCapacity) * 100).toInt()}%', Icons.people),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 16, color: AppColors.secondary),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
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
}
