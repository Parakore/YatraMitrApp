import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/status_pill.dart';
import '../viewmodel/emergency_viewmodel.dart';
import '../model/sos_incident.dart';

class IncidentHistoryScreen extends ConsumerWidget {
  const IncidentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emergencyState = ref.watch(emergencyProvider);
    final incidents = emergencyState
        .recentIncidents; // In a real app, this might be a separate provider for full history

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        title: const Text(
          'Emergency Logs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: AppColors.secondary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSummaryHeader(incidents.length),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: incidents.length,
              itemBuilder: (context, index) {
                final inc = incidents[index];
                return _buildIncidentDetailCard(inc);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryHeader(int count) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          _buildStatItem('Total Incidents', count.toString(), AppColors.secondary),
          const SizedBox(width: 20),
          _buildStatItem('Resolved', '100%', AppColors.success),
          const SizedBox(width: 20),
          _buildStatItem('Avg Response', '4.2m', AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w900, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildIncidentDetailCard(SosIncident inc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusPill(
                label: inc.status.toUpperCase(),
                type: inc.status.toLowerCase() == 'resolved'
                    ? StatusType.safe
                    : StatusType.warning,
              ),
              Text(
                inc.time,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            inc.pilgrim,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: AppColors.secondary),
          ),
          const SizedBox(height: 4),
          Text(
            inc.type,
            style: const TextStyle(
                fontSize: 13,
                color: AppColors.primary,
                fontWeight: FontWeight.w800),
          ),
          const Divider(height: 32),
          _buildDetailRow(Icons.location_on_outlined, 'Location', inc.location),
          const SizedBox(height: 12),
          _buildDetailRow(
              Icons.timer_outlined, 'Response Time', inc.responseTime),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.shield_outlined, 'Agency', inc.agency),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Incident resolved by SDRF Team B. Pilgrim safely transported to Base Camp Medical Unit.',
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey.shade600, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade400),
        const SizedBox(width: 12),
        Text(
          '$label:',
          style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
      ],
    );
  }
}
