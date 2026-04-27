import 'package:flutter/material.dart';
import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:yatramitra/shared/widgets/status_pill.dart';
import '../../model/sos_incident.dart';

class RecentIncidentsList extends StatelessWidget {
  final List<SosIncident> incidents;
  final VoidCallback onViewAll;

  const RecentIncidentsList({
    super.key,
    required this.incidents,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'RECENT INCIDENTS',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: AppColors.secondary,
                  letterSpacing: 1.2,
                ),
              ),
              TextButton(
                onPressed: onViewAll,
                child: const Text(
                  'VIEW ALL',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: incidents.length,
          itemBuilder: (context, index) {
            return _buildIncidentCard(incidents[index]);
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildIncidentCard(SosIncident inc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                const Icon(Icons.emergency, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inc.pilgrim,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  '${inc.type} • ${inc.time}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          StatusPill(
            label: inc.status,
            type: inc.status.toLowerCase() == 'resolved' ? StatusType.safe : StatusType.danger,
          ),
        ],
      ),
    );
  }
}
