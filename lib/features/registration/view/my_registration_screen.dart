import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:yatramitra/shared/widgets/yatra_app_bar.dart';
import 'package:yatramitra/shared/widgets/yatra_card.dart';
import 'package:yatramitra/shared/widgets/yatra_section_header.dart';
import '../viewmodel/registration_viewmodel.dart';
import '../model/registration_model.dart';

/// Screen displaying the pilgrim's registration dashboard.
class MyRegistrationScreen extends ConsumerWidget {
  const MyRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(registrationViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: YatraAppBar(
        title: 'My Registration',
        showBackButton: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.download_rounded, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Downloading E-Pass...')),
              );
            },
          ),
        ],
      ),
      body: stateAsync.when(
        data: (data) => _buildContent(context, data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, RegistrationDashboardModel data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          _buildProfileCard(data.profile),
          const SizedBox(height: 24),

          // Registration Details
          const YatraSectionHeader(
            title: 'Registration Details',
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: 12),
          _buildRegistrationDetails(data.yatraDetails),
          const SizedBox(height: 24),

          // Health & Risk Profile
          const YatraSectionHeader(
            title: 'Health & Risk Profile',
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: 12),
          _buildHealthRiskProfile(data.healthProfile),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildProfileCard(RegistrationProfile profile) {
    return YatraCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: const Text(
              'RS', // Initial for Ramesh Sharma
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            profile.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
            ),
          ),
          Text(
            profile.pilId,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (profile.isEkycVerified)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified_rounded, color: Colors.green, size: 14),
                  SizedBox(width: 6),
                  Text(
                    'eKYC Verified',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
          _buildProfileDetailRow('Aadhaar', profile.maskedAadhaar),
          _buildProfileDetailRow('Age', '${profile.age} Years'),
          _buildProfileDetailRow('State', profile.state),
          _buildProfileDetailRow('Mobile', profile.mobile),
          _buildProfileDetailRow('Group Size', '${profile.groupSize} Persons'),
          _buildProfileDetailRow(
            'Health Score',
            '${profile.healthScore}/100',
            valueColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetailRow(String label, String value,
      {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegistrationDetails(YatraDetails details) {
    return YatraCard(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 2.2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildDetailItem('REGISTRATION ID', details.registrationId),
          _buildDetailItem('YATRA TYPE', details.yatraType),
          _buildDetailItem('REG. DATE', details.registrationDate),
          _buildDetailItem('YATRA START', details.yatraStartDate),
          _buildDetailItem(
            'STATUS',
            details.status,
            valueColor: Colors.green,
          ),
          _buildDetailItem('GUIDE', details.guideName),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 9,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppColors.secondary,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildHealthRiskProfile(HealthRiskProfile health) {
    return YatraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HEALTH SCORE',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${health.score}/100',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'RISK CATEGORY',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        health.riskCategory,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: health.score / 100,
            backgroundColor: Colors.grey.shade100,
            color: Colors.green,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text(
            health.riskDescription,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(height: 1),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: health.vitals.map((vital) {
              final isWarning = vital.startsWith('!');
              final cleanVital = isWarning ? vital.substring(2) : vital;
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: (isWarning ? Colors.orange : Colors.green)
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isWarning ? Icons.warning_rounded : Icons.check_rounded,
                      color: isWarning ? Colors.orange : Colors.green,
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      cleanVital,
                      style: TextStyle(
                        color: isWarning ? Colors.orange : Colors.green,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.info_outline_rounded,
                        color: AppColors.primary, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Medical certificate valid until 31-Oct-2025.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Issued by: ${health.issuedBy}',
                  style: const TextStyle(
                      fontSize: 10, color: AppColors.textSecondary),
                ),
                Text(
                  'Certificate ID: ${health.certificateId}',
                  style: const TextStyle(
                      fontSize: 10, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
