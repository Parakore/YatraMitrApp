import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/hive_service.dart';
import '../model/app_user.dart';
import '../model/registration_model.dart';
import '../repository/registration_repository.dart';

/// Provider for the RegistrationRepository.
final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  return RegistrationRepositoryImpl(hiveService);
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

  /// Registers a new user locally.
  Future<void> register(AppUser user) async {
    state = const AsyncValue.loading();
    final repository = ref.read(registrationRepositoryProvider);
    
    // Mark as registered and save
    final registeredUser = user.copyWith(isRegistered: true);
    await repository.saveAppUser(registeredUser);
    
    // Refresh dashboard
    state = await AsyncValue.guard(() => _fetchDashboard());
  }

  /// Refreshes the dashboard data.
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchDashboard());
  }
}

/// Helper provider to check registration status.
final isUserRegisteredProvider = FutureProvider<bool>((ref) async {
  final repository = ref.read(registrationRepositoryProvider);
  return repository.isRegistered();
});
