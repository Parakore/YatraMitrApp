import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/disaster_models.dart';
import '../repository/disaster_repository.dart';

part 'disaster_viewmodel.g.dart';

@riverpod
class DisasterIntelligenceViewModel extends _$DisasterIntelligenceViewModel {
  @override
  FutureOr<DisasterIntelligenceSummary> build() async {
    return ref.watch(disasterRepositoryProvider).getDisasterSummary();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(disasterRepositoryProvider).getDisasterSummary(),
    );
  }
}

@riverpod
FutureOr<List<RouteStatus>> routeStatuses(RouteStatusesRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.routeStatuses;
}

@riverpod
FutureOr<WeatherSummary> weatherSummary(WeatherSummaryRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.weatherSummary;
}

@riverpod
FutureOr<List<AlertModel>> activeAlerts(ActiveAlertsRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.activeAlerts;
}

@riverpod
FutureOr<List<ForecastModel>> forecast(ForecastRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.fiveDayForecast;
}

@riverpod
FutureOr<List<LandslideZone>> riskZones(RiskZonesRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.landslideZones;
}

@riverpod
FutureOr<List<RouteClosure>> routeClosures(RouteClosuresRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.routeClosures;
}

@riverpod
FutureOr<List<String>> aiRecommendations(AiRecommendationsRef ref) async {
  final summary = await ref.watch(disasterIntelligenceViewModelProvider.future);
  return summary.aiRecommendations;
}
