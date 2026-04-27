import 'package:flutter/material.dart';
import 'package:yatramitra/core/theme/app_colors.dart';

/// Premium header for the Facilities Locator.
/// Includes search and crowd intelligence summary.
class NearbyHeader extends StatelessWidget {
  final String crowdStatus;
  final String crowdDetail;
  final ValueChanged<String>? onSearchChanged;

  const NearbyHeader({
    super.key,
    required this.crowdStatus,
    required this.crowdDetail,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar in a Premium Card
          TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search facilities (ATM, Medical...)',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon:
                  const Icon(Icons.search, color: AppColors.primary, size: 20),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 16),
          // Crowd Summary Block
          _buildCrowdIntel(context),
        ],
      ),
    );
  }

  Widget _buildCrowdIntel(BuildContext context) {
    final isCrowded = crowdStatus.toLowerCase().contains('crowded');
    final statusColor = isCrowded ? Colors.orange : Colors.green;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCrowded ? Icons.people : Icons.person_outline,
              color: statusColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crowd Intel: $crowdStatus',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                ),
                Text(
                  crowdDetail,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}
