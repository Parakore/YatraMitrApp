import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/error_widget.dart';
import '../viewmodel/weather_viewmodel.dart';
import '../model/weather_models.dart';
import 'widgets/current_weather_card.dart';
import 'widgets/forecast_list.dart';
import 'widgets/weather_tips_card.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'WEATHER & SAFETY',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0D1B2A), Color(0xFF1A3A6B)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(height: 4, color: AppColors.saffron),
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(weatherViewModelProvider.notifier).refresh(),
        color: AppColors.saffron,
        child: weatherState.when(
          data: (intelligence) => _buildContent(context, intelligence),
          loading: () => const LoadingWidget(message: 'Consulting weather satellites...'),
          error: (error, stack) => AppErrorWidget(
            errorMessage: error.toString(),
            onRetry: () => ref.read(weatherViewModelProvider.notifier).refresh(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WeatherIntelligence intelligence) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentWeatherCard(intelligence: intelligence),
          const SizedBox(height: 24),
          _buildRecommendationBlock(intelligence),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '5-Day Forecast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
          ),
          const SizedBox(height: 12),
          ForecastList(forecasts: intelligence.forecasts),
          const SizedBox(height: 24),
          WeatherTipsCard(tips: intelligence.tips),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildRecommendationBlock(WeatherIntelligence intelligence) {
    Color statusColor;
    IconData statusIcon;

    switch (intelligence.riskLevel) {
      case 'High':
        statusColor = AppColors.error;
        statusIcon = Icons.report_problem;
        break;
      case 'Medium':
        statusColor = AppColors.warning;
        statusIcon = Icons.warning_amber_rounded;
        break;
      default:
        statusColor = AppColors.success;
        statusIcon = Icons.check_circle_outline;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: statusColor.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor.withAlpha(50), width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(statusIcon, color: statusColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🤖 Safety Recommendation',
                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  intelligence.safetyRecommendation,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
