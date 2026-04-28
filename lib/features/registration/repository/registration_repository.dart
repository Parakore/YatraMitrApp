import '../model/registration_model.dart';

/// Repository for handling registration-related data operations.
abstract class RegistrationRepository {
  Future<RegistrationDashboardModel> getRegistrationDashboard();
}

/// Mock implementation of RegistrationRepository for development.
class MockRegistrationRepository implements RegistrationRepository {
  @override
  Future<RegistrationDashboardModel> getRegistrationDashboard() async {
    // Simulate network delay
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
}
