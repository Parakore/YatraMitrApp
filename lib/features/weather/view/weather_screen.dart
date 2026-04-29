import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:yatramitra/shared/widgets/loading_widget.dart';
import 'package:yatramitra/shared/widgets/error_widget.dart';
import 'package:yatramitra/shared/widgets/yatra_app_bar.dart';
import 'package:yatramitra/shared/widgets/yatra_section_header.dart';
import 'package:yatramitra/shared/widgets/yatra_info_card.dart';
import 'package:yatramitra/features/weather/viewmodel/weather_viewmodel.dart';
import 'package:yatramitra/features/weather/model/weather_models.dart';
import 'package:yatramitra/features/weather/view/widgets/current_weather_card.dart';
import 'package:yatramitra/features/weather/view/widgets/forecast_list.dart';
import 'package:yatramitra/features/weather/utils/weather_utils.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const YatraAppBar(
        title: 'Weather & Safety',
      ),
      body: Column(
        children: [
          _buildLocationSelector(ref),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () =>
                  ref.read(weatherViewModelProvider.notifier).refresh(),
              color: AppColors.saffron,
              child: weatherState.when(
                data: (intelligence) => _buildContent(context, intelligence),
                loading: () => const LoadingWidget(
                    message: 'Consulting weather satellites...'),
                error: (error, stack) => AppErrorWidget(
                  errorMessage: error.toString(),
                  onRetry: () =>
                      ref.read(weatherViewModelProvider.notifier).refresh(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSelector(WidgetRef ref) {
    final selectedLocation = ref.watch(selectedWeatherLocationProvider);

    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: charDhamLocations.length,
        itemBuilder: (context, index) {
          final location = charDhamLocations[index];
          final isSelected = selectedLocation.name == location.name;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(
                location.name,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  ref
                      .read(weatherViewModelProvider.notifier)
                      .setLocation(location);
                }
              },
              selectedColor: AppColors.primary,
              backgroundColor: Colors.white,
              elevation: isSelected ? 4 : 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : Colors.black12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, WeatherIntelligence intelligence) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentWeatherCard(intelligence: intelligence),
          const SizedBox(height: 16),
          YatraInfoCard(
            title: '🤖 Safety Recommendation',
            content: intelligence.safetyRecommendation,
            icon: WeatherUtils.getRiskIcon(intelligence.riskLevel),
            severity: intelligence.riskLevel,
          ),
          const YatraSectionHeader(title: '5-Day Forecast'),
          ForecastList(forecasts: intelligence.forecasts),
          YatraInfoCard(
            title: 'Preparation Guide',
            content: 'Safety tips for this area',
            icon: Icons.lightbulb_outline_rounded,
            severity: 'Low',
            bulletPoints: intelligence.tips,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
