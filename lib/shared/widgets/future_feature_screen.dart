import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yatramitra/core/theme/app_colors.dart';

/// A premium, high-contrast "Coming Soon" screen for upcoming features.
/// Designed for pilgrims and elderly users with clear typography and premium aesthetics.
class FutureFeatureScreen extends StatelessWidget {
  final String featureName;

  const FutureFeatureScreen({
    super.key,
    required this.featureName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Premium Icon/Illustration Placeholder
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.saffron.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 80,
                    color: AppColors.saffron,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                featureName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This feature is currently under spiritual development and will be available in the upcoming build.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              // Progress indicator to show something is happening
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  backgroundColor: AppColors.surface,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.saffron),
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(height: 64),
              ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Go Back',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
