import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/yatra_app_bar.dart';
import '../../../shared/widgets/yatra_section_header.dart';
import '../../../shared/widgets/yatra_info_card.dart';
import '../viewmodel/weather_viewmodel.dart';
import '../model/weather_models.dart';
import 'widgets/current_weather_card.dart';
import 'widgets/forecast_list.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      appBar: const YatraAppBar(
        title: 'Weather & Safety',
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
          YatraInfoCard(
            title: '🤖 Safety Recommendation',
            content: intelligence.safetyRecommendation,
            icon: intelligence.riskLevel == 'High' 
                ? Icons.report_problem 
                : (intelligence.riskLevel == 'Medium' ? Icons.warning_amber_rounded : Icons.check_circle_outline),
            severity: intelligence.riskLevel,
          ),
          const YatraSectionHeader(title: '5-Day Forecast'),
          ForecastList(forecasts: intelligence.forecasts),
          YatraInfoCard(
            title: 'Safety Tips',
            content: 'Preparation for your journey',
            icon: Icons.lightbulb_outline,
            severity: 'Low',
            bulletPoints: intelligence.tips,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

}
