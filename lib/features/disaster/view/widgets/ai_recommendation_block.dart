import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AiRecommendationBlock extends StatelessWidget {
  final List<String> recommendations;
  const AiRecommendationBlock({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.saffron.withAlpha(20),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.saffron.withAlpha(80), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.saffron.withAlpha(10),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.saffron.withAlpha(40),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.psychology_rounded,
                    color: AppColors.saffron, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'AI Insights',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.saffron,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...recommendations.map((rec) => _buildRecommendationItem(rec)),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.saffron,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
