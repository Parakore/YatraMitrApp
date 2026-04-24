import 'package:flutter/material.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../nearby/view/nearby_screen.dart';

/// The primary home dashboard for YatraMitra.
/// Showcases the design system with high contrast and minimalist layout.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('YatraMitra'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Namaste, Pilgrim',
                style: theme.textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Safe travels on your holy journey.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 32),
            
            // Primary Action Section
            AppCard(
              color: theme.colorScheme.surface,
              child: Column(
                children: [
                  const Icon(
                    Icons.explore_rounded,
                    size: 48,
                    color: Color(0xFF1E3A8A), // Blue
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Explore Nearby Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Find verified rest areas, clinics, and clean water near you.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'View Services',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NearbyScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Secondary Actions Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AppCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.map_rounded, size: 32),
                          const SizedBox(height: 12),
                          const Text('Offline Maps'),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.book_rounded, size: 32),
                          const SizedBox(height: 12),
                          const Text('Yatra Guide'),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Emergency Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppButton(
                text: 'EMERGENCY SOS',
                icon: Icons.warning_amber_rounded,
                onPressed: () {},
                isDanger: true,
              ),
            ),
            // Custom styling for SOS as per rule: SOS -> Red
          ],
        ),
      ),
    );
  }
}
