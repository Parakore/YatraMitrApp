import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:yatramitra/features/emergency/viewmodel/emergency_viewmodel.dart';
import 'package:yatramitra/features/emergency/view/widgets/sos_hero_section.dart';
import 'package:yatramitra/features/emergency/view/widgets/workflow_tracker.dart';
import 'package:yatramitra/features/emergency/view/widgets/tactical_hotlines.dart';
import 'package:yatramitra/features/emergency/view/widgets/recent_incidents_list.dart';
import 'package:yatramitra/features/emergency/view/widgets/emergency_categories.dart';

class EmergencyScreen extends ConsumerStatefulWidget {
  const EmergencyScreen({super.key});

  @override
  ConsumerState<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends ConsumerState<EmergencyScreen> {
  Timer? _holdTimer;
  double _sosProgress = 0.0;

  void _startSosTimer() {
    _sosProgress = 0.0;
    _holdTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _sosProgress += 0.01;
        if (_sosProgress >= 1.0) {
          _sosProgress = 1.0;
          timer.cancel();
          ref.read(emergencyProvider.notifier).triggerSos();
          _showSosTriggeredFeedback();
        }
      });
    });
  }

  void _stopSosTimer() {
    if (_sosProgress < 1.0) {
      _holdTimer?.cancel();
      setState(() {
        _sosProgress = 0.0;
      });
    }
  }

  void _showSosTriggeredFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('SOS SIGNAL DISPATCHED! Emergency units notified.'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.saffron,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emergencyState = ref.watch(emergencyProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.surface),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'SOS Emergency',
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0D1B2A), Color(0xFF1A3A6B)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(height: 4, color: AppColors.saffron),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: emergencyState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SosHeroSection(
                    isSosActive: emergencyState.isSosActive,
                    lastLocation: emergencyState.lastLocation,
                    sosProgress: _sosProgress,
                    onSosHoldStart: _startSosTimer,
                    onSosHoldEnd: _stopSosTimer,
                    onCancel: () =>
                        ref.read(emergencyProvider.notifier).cancelSos(),
                  ),
                  _buildSectionHeader('Emergency Context'),
                  EmergencyCategories(
                    selectedCategory: emergencyState.selectedCategory,
                    onCategorySelected: (cat) =>
                        ref.read(emergencyProvider.notifier).setCategory(cat),
                  ),
                  _buildSectionHeader('Rescue Workflow'),
                  WorkflowTracker(steps: emergencyState.workflowSteps),
                  _buildSectionHeader('Tactical Hotlines'),
                  TacticalHotlines(contacts: emergencyState.emergencyContacts),
                  _buildSectionHeader('Incident Log History'),
                  RecentIncidentsList(
                    incidents: emergencyState.recentIncidents,
                    onViewAll: () => context.push('/emergency/history'),
                  ),
                ],
              ),
            ),
    );
  }
}
