import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yatramitra/core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../model/app_user.dart';
import '../viewmodel/registration_viewmodel.dart';

/// Premium Multi-step Yatra Registration Screen.
/// Updated to capture user data and store it locally in Hive via RegistrationViewModel.
class YatraRegistrationScreen extends ConsumerStatefulWidget {
  const YatraRegistrationScreen({super.key});

  @override
  ConsumerState<YatraRegistrationScreen> createState() =>
      _YatraRegistrationScreenState();
}

class _YatraRegistrationScreenState
    extends ConsumerState<YatraRegistrationScreen> {
  int _currentStep = 0;

  // Controllers for personal info
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();

  // Controllers for health info (simplified for now)
  final _allergiesController = TextEditingController();
  final _medsController = TextEditingController();

  // Controllers for emergency contacts
  final _kinNameController = TextEditingController();
  final _kinRelationController = TextEditingController();
  final _kinPhoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _allergiesController.dispose();
    _medsController.dispose();
    _kinNameController.dispose();
    _kinRelationController.dispose();
    _kinPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildProgressIndicator(),
                  const SizedBox(height: 32),
                  _buildStepContent(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          _buildBottomActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D1B2A), Color(0xFF1A3A6B)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 16),
          const Text(
            'Yatra Registration',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            'Register yourself for a safe and secure pilgrimage.',
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: List.generate(3, (index) {
        final isActive = index <= _currentStep;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.grey[200],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildPersonalInfoStep();
      case 1:
        return _buildHealthStep();
      case 2:
        return _buildEmergencyStep();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPersonalInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Personal Information'),
        const SizedBox(height: 24),
        _buildTextField('Full Name', Icons.person_outline, 'e.g. Rajesh Kumar',
            controller: _nameController),
        _buildTextField(
            'Aadhar / ID Number', Icons.badge_outlined, '12-digit number',
            controller: _idController),
        _buildTextField('Age', Icons.cake_outlined, 'e.g. 45',
            controller: _ageController, keyboardType: TextInputType.number),
        _buildTextField(
            'Phone Number', Icons.phone_outlined, '+91-XXXXX XXXXX',
            controller: _phoneController, keyboardType: TextInputType.phone),
      ],
    );
  }

  Widget _buildHealthStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Health Declaration'),
        const SizedBox(height: 24),
        _buildSelectionCard('Do you have any heart conditions?', ['Yes', 'No']),
        _buildSelectionCard('Respiratory issues / Asthma?', ['Yes', 'No']),
        _buildTextField('Allergies (if any)', Icons.medical_services_outlined,
            'e.g. Penicillin',
            controller: _allergiesController),
        _buildTextField('Current Medications', Icons.medication_outlined,
            'List any medications',
            controller: _medsController),
      ],
    );
  }

  Widget _buildEmergencyStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Emergency Contacts'),
        const SizedBox(height: 24),
        _buildTextField(
            'Kin Name', Icons.family_restroom_outlined, 'Primary contact name',
            controller: _kinNameController),
        _buildTextField('Kin Relation', Icons.link_outlined, 'e.g. Spouse, Son',
            controller: _kinRelationController),
        _buildTextField(
            'Kin Phone', Icons.phone_android_outlined, 'Primary contact phone',
            controller: _kinPhoneController, keyboardType: TextInputType.phone),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.primary, size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Your emergency contact will be notified automatically in case of an SOS activation.',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      height: 1.4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
                color: AppColors.saffron,
                borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 12),
        Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppColors.secondary)),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon, String hint,
      {TextEditingController? controller, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4))
              ],
            ),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[300], fontSize: 14),
                prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionCard(String question, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary)),
          const SizedBox(height: 12),
          Row(
            children: options.map((opt) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Center(
                    child: Text(opt,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5))
        ],
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: () => setState(() => _currentStep--),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  side: const BorderSide(color: AppColors.primary),
                ),
                child: const Text('Back',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold)),
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                if (_currentStep < 2) {
                  setState(() => _currentStep++);
                } else {
                  _handleRegistration();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
              ),
              child: Text(
                _currentStep == 2 ? 'Complete Registration' : 'Next Step',
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleRegistration() {
    // Validate basic info
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final user = AppUser(
      name: _nameController.text,
      phone: _phoneController.text,
      age: _ageController.text,
      idNumber: _idController.text,
      emergencyContactName: _kinNameController.text,
      emergencyContactPhone: _kinPhoneController.text,
    );

    ref.read(registrationViewModelProvider.notifier).register(user);
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const Icon(Icons.check_circle, color: AppColors.success, size: 64),
            const SizedBox(height: 24),
            const Text('Registration Successful',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.secondary)),
            const SizedBox(height: 12),
            Text(
              'Welcome, ${_nameController.text}! Your Yatra registration has been confirmed and stored locally.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  context.go(AppRouter.home); // Go home
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Go Home',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
