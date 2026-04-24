import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/disaster_alert.dart';
import '../repository/disaster_repository.dart';
import '../service/disaster_service.dart';

part 'alert_viewmodel.g.dart';

@riverpod
DisasterService disasterService(DisasterServiceRef ref) => DisasterService();

@riverpod
DisasterRepository disasterRepository(DisasterRepositoryRef ref) =>
    DisasterRepository(ref.watch(disasterServiceProvider));

@riverpod
class AlertViewModel extends _$AlertViewModel {
  @override
  FutureOr<List<DisasterAlert>> build() async {
    return ref.watch(disasterRepositoryProvider).getActiveAlerts();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(disasterRepositoryProvider).getActiveAlerts(),
    );
  }
}

@riverpod
FutureOr<Map<String, dynamic>> weatherForecast(WeatherForecastRef ref) {
  return ref.watch(disasterRepositoryProvider).getWeather();
}
