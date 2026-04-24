import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AiRecommendationBlock extends StatelessWidget {
  final List<String> recommendations;
  const AiRecommendationBlock({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.saffron.withAlpha(13),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.saffron.withAlpha(51), width: 1),
      ),
      child: Column(
        children: recommendations.map((rec) => _buildRecommendationItem(rec)).toList(),
      ),
    );
  }

  Widget _buildRecommendationItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_awesome, color: AppColors.saffron, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
