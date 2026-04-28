import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/registration_model.dart';
import '../repository/registration_repository.dart';

/// Provider for the RegistrationRepository.
final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  return MockRegistrationRepository();
});

/// Provider for the RegistrationViewModel.
final registrationViewModelProvider =
    AsyncNotifierProvider<RegistrationViewModel, RegistrationDashboardModel>(
        RegistrationViewModel.new);

/// ViewModel for managing the Registration Dashboard state.
class RegistrationViewModel extends AsyncNotifier<RegistrationDashboardModel> {
  @override
  Future<RegistrationDashboardModel> build() async {
    return _fetchDashboard();
  }

  Future<RegistrationDashboardModel> _fetchDashboard() async {
    final repository = ref.read(registrationRepositoryProvider);
    return repository.getRegistrationDashboard();
  }

  /// Refreshes the dashboard data.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchDashboard());
  }
}
