import '../../../core/storage/hive_service.dart';
import '../model/app_user.dart';
import '../model/registration_model.dart';

/// Repository for handling registration-related data operations.
abstract class RegistrationRepository {
  Future<RegistrationDashboardModel> getRegistrationDashboard();
  
  /// Fetches the local application user.
  Future<AppUser> getAppUser();
  
  /// Saves the local application user.
  Future<void> saveAppUser(AppUser user);
  
  /// Checks if the user is already registered.
  Future<bool> isRegistered();
}

/// Implementation of RegistrationRepository using Hive.
class RegistrationRepositoryImpl implements RegistrationRepository {
  final HiveService _hiveService;
  static const String _userBox = 'user_box';
  static const String _userKey = 'current_user';

  RegistrationRepositoryImpl(this._hiveService);

  @override
  Future<AppUser> getAppUser() async {
    final user = await _hiveService.getData<AppUser>(_userBox, _userKey);
    return user ?? AppUser.guest();
  }

  @override
  Future<void> saveAppUser(AppUser user) async {
    await _hiveService.putData(_userBox, _userKey, user);
  }

  @override
  Future<bool> isRegistered() async {
    final user = await getAppUser();
    return user.isRegistered;
  }

  @override
  Future<RegistrationDashboardModel> getRegistrationDashboard() async {
    final user = await getAppUser();
    
    // In a real app, this would fetch from an API based on the user's ID.
    // For now, we return mock data combined with the local user's name.
    return RegistrationDashboardModel(
      profile: RegistrationProfile(
        name: user.name,
        pilId: user.isRegistered ? 'PIL-2025-0001' : 'N/A',
        isEkycVerified: user.isRegistered,
        maskedAadhaar: user.idNumber.length > 4 
            ? 'XXXX-XXXX-${user.idNumber.substring(user.idNumber.length - 4)}' 
            : 'XXXX-XXXX-XXXX',
        age: int.tryParse(user.age) ?? 0,
        state: 'Uttarakhand', // Default or from user model
        mobile: user.phone,
        groupSize: 1,
        healthScore: 85,
      ),
      yatraDetails: const YatraDetails(
        registrationId: 'REG-2025-KDN-0001',
        yatraType: 'Char Dham',
        registrationDate: '10-Jun-2025',
        yatraStartDate: '15-Jun-2025',
        status: 'Active',
        guideName: 'Suresh Negi',
        guideId: 'GID-421',
      ),
      healthProfile: const HealthRiskProfile(
        score: 85,
        riskCategory: 'Low Risk',
        riskDescription: 'Fit for high altitude trek',
        vitals: ['BP Normal', 'Diabetes: No', 'Heart: Normal'],
        validity: '31-Oct-2025',
        issuedBy: 'Government Medical Center',
        certificateId: 'HLTH-2025-0891',
      ),
    );
  }
}

/// Mock implementation of RegistrationRepository for development.
class MockRegistrationRepository implements RegistrationRepository {
  @override
  Future<RegistrationDashboardModel> getRegistrationDashboard() async {
    await Future.delayed(const Duration(seconds: 1));
    return const RegistrationDashboardModel(
      profile: RegistrationProfile(
        name: 'Ramesh Kumar Sharma',
        pilId: 'PIL-2025-0001',
        isEkycVerified: true,
        maskedAadhaar: 'XXXX-XXXX-3421',
        age: 42,
        state: 'Uttar Pradesh',
        mobile: '+91 98765 43210',
        groupSize: 2,
        healthScore: 87,
      ),
      yatraDetails: YatraDetails(
        registrationId: 'REG-2025-KDN-0001',
        yatraType: 'Char Dham (Do Dham)',
        registrationDate: '10-Jun-2025',
        yatraStartDate: '15-Jun-2025',
        status: 'Active',
        guideName: 'Suresh Negi',
        guideId: 'GID-421',
      ),
      healthProfile: HealthRiskProfile(
        score: 87,
        riskCategory: 'Low Risk',
        riskDescription: 'Fit for Kedarnath & Badrinath trek',
        vitals: [
          'BP Normal',
          'Diabetes: No',
          'Heart: Normal',
          '! Mild Asthma — Inhaler Advised',
        ],
        validity: '31-Oct-2025',
        issuedBy: 'AIIMS Rishikesh Health Camp',
        certificateId: 'HLTH-2025-0891',
      ),
    );
  }

  @override
  Future<AppUser> getAppUser() async => AppUser.guest();

  @override
  Future<bool> isRegistered() async => false;

  @override
  Future<void> saveAppUser(AppUser user) async {}
}
