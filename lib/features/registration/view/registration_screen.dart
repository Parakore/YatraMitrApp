import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatramitra/shared/widgets/yatra_app_bar.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';

/// Screen providing different registration paths for the Char Dham Yatra.
/// Designed for high accessibility and clarity for elderly users.
class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const YatraAppBar(title: 'Yatra Registration'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 30),
            _buildOptionCard(
              context,
              title: 'Register via WhatsApp',
              subtitle:
                  'Easiest for elderly users. Just send "Yatra" to start.',
              icon: Icons.chat_rounded,
              color: const Color(0xFF25D366),
              onTap: () => _launchWhatsApp(),
              isRecommended: true,
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              title: 'Official Web Portal',
              subtitle: 'Open the government website inside the app.',
              icon: Icons.language_rounded,
              color: AppColors.secondary,
              onTap: () => context.push(AppRouter.officialRegistrationWebView),
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              title: 'Registration Guide',
              subtitle: 'See what documents you need before starting.',
              icon: Icons.assignment_rounded,
              color: AppColors.accent,
              onTap: () {
                _showGuideDialog(context);
              },
            ),
            const SizedBox(height: 40),
            _buildSafetyNote(),
            const SizedBox(height: 40),
            _buildPostRegistrationTools(context),
            const SizedBox(height: 40),
            _buildOfficialHelplines(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mandatory Registration',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Registration is required for all pilgrims visiting Char Dham. Choose your preferred method below.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    bool isRecommended = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isRecommended ? color : AppColors.divider,
            width: isRecommended ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isRecommended)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'RECOMMENDED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostRegistrationTools(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Already Registered?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                title: 'Check Status',
                icon: Icons.fact_check_rounded,
                color: AppColors.success,
                onTap: () => context.push(
                  AppRouter.officialRegistrationWebView,
                  extra: 'https://registrationandtouristcare.uk.gov.in/verify_registration.php',
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                title: 'Download Card',
                icon: Icons.download_for_offline_rounded,
                color: AppColors.secondary,
                onTap: () => context.push(
                  AppRouter.officialRegistrationWebView,
                  extra: 'https://registrationandtouristcare.uk.gov.in/yatri_darshan_certificate.php',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfficialHelplines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Official Helplines',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            children: [
              _buildHelplineItem(
                title: 'Tourist Care Helpline',
                number: '1364',
                subtitle: 'Uttarakhand Tourism Support',
                icon: Icons.headset_mic_rounded,
              ),
              const Divider(height: 1, indent: 60),
              _buildHelplineItem(
                title: 'Police Emergency',
                number: '112',
                subtitle: 'Immediate Police Assistance',
                icon: Icons.local_police_rounded,
                color: AppColors.error,
              ),
              const Divider(height: 1, indent: 60),
              _buildHelplineItem(
                title: 'Medical Help',
                number: '108',
                subtitle: 'Ambulance & Health Emergencies',
                icon: Icons.emergency_rounded,
                color: AppColors.success,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHelplineItem({
    required String title,
    required String number,
    required String subtitle,
    required IconData icon,
    Color color = AppColors.secondary,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.call, color: Colors.white, size: 14),
            const SizedBox(width: 4),
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () => launchUrl(Uri.parse('tel:$number')),
    );
  }

  Widget _buildSafetyNote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
      ),
      child: const Row(
        children: [
          Icon(Icons.security_rounded, color: Colors.red),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Beware of fake websites. Only register through official government channels provided here.',
              style: TextStyle(
                color: Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchWhatsApp() async {
    const phone = "+918394833833";
    const message = "Yatra";
    final url = Uri.parse(
        "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Fallback to web whatsapp if app is not installed
      final webUrl = Uri.parse(
          "https://wa.me/$phone?text=${Uri.encodeComponent(message)}");
      await launchUrl(webUrl, mode: LaunchMode.externalApplication);
    }
  }

  void _showGuideDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Documents Needed',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _guideItem('Aadhaar Card (or any ID Proof)'),
            _guideItem('Active Mobile Number'),
            _guideItem('Emergency Contact Details'),
            _guideItem('Vehicle Number (if driving)'),
            _guideItem('Recent Passport Size Photo (Digital)'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('GOT IT'),
          ),
        ],
      ),
    );
  }

  Widget _guideItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline_rounded,
              color: AppColors.secondary, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: AppColors.textPrimary, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
