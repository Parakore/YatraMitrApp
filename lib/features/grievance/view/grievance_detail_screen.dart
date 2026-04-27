import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../model/grievance_model.dart';

/// Screen for tracking a specific grievance following the 5-step workflow.
/// Displays a vertical resolution stepper with timestamps and department info.
class GrievanceDetailScreen extends ConsumerWidget {
  final Grievance grievance;

  const GrievanceDetailScreen({super.key, required this.grievance});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusHeader(),
            _buildDetailsCard(),
            _buildSectionHeader('RESOLUTION WORKFLOW'),
            _buildVerticalWorkflow(),
            if (grievance.status == GrievanceStatus.resolved)
              _buildFeedbackSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Track Complaint',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.1),
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
    );
  }

  Widget _buildStatusHeader() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(grievance.id,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: AppColors.primary)),
                  Text(
                    'Filed on ${grievance.timestamp.day}-${grievance.timestamp.month} ${grievance.timestamp.hour}:${grievance.timestamp.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
              _buildStatusBadge(),
            ],
          ),
          if (grievance.status != GrievanceStatus.resolved) ...[
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.timer_outlined,
                    color: AppColors.warning, size: 20),
                const SizedBox(width: 10),
                Text(
                  grievance.sla ?? 'Calculating SLA...',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColors.warning),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    final color = _getStatusColor(grievance.status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        grievance.status.name.toUpperCase(),
        style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 5))
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow(
              Icons.category_outlined, 'Category', grievance.category),
          const SizedBox(height: 16),
          _buildDetailRow(Icons.location_on_outlined, 'Location',
              grievance.geoTag ?? 'Current GPS Position'),
          const SizedBox(height: 16),
          _buildDetailRow(Icons.business_center_outlined, 'Department',
              grievance.department ?? 'AI Assigning...'),
          const Divider(height: 32),
          const Text('DESCRIPTION',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  letterSpacing: 1.1)),
          const SizedBox(height: 8),
          Text(
            grievance.description,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFFF1F4F8),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, size: 18, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(),
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey)),
            Text(value,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary)),
          ],
        ),
      ],
    );
  }

  Widget _buildVerticalWorkflow() {
    final steps = [
      _WorkflowStep('Submit Complaint + Geo Tag',
          'Complaint received and location verified.', GrievanceStatus.pending),
      _WorkflowStep(
          'AI Dept. Allocation',
          'Grievance routed to ${grievance.department ?? 'appropriate department'}.',
          GrievanceStatus.allocating),
      _WorkflowStep(
          'SLA Timer Started',
          'Resolution clock initialized (${grievance.sla ?? '8 hrs'}).',
          GrievanceStatus.inProgress),
      _WorkflowStep(
          'Action Taken',
          'Field agents dispatched/Resources deployed.',
          GrievanceStatus.actionTaken),
      _WorkflowStep(
          'Resolution + Feedback',
          'Problem solved. Please provide your feedback.',
          GrievanceStatus.resolved),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];
          final isCompleted = _isStepCompleted(index);
          final isCurrent = _isCurrentStep(index);

          return IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppColors.success
                            : (isCurrent ? AppColors.primary : Colors.white),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: isCompleted
                                ? AppColors.success
                                : (isCurrent
                                    ? AppColors.primary
                                    : Colors.grey.shade300),
                            width: 2),
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(Icons.check,
                                size: 14, color: Colors.white)
                            : Text('${index + 1}',
                                style: TextStyle(
                                    color:
                                        isCurrent ? Colors.white : Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                    if (index < steps.length - 1)
                      Expanded(
                        child: Container(
                            width: 2,
                            color: isCompleted
                                ? AppColors.success
                                : Colors.grey.shade200),
                      ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: isCompleted || isCurrent
                                ? AppColors.textPrimary
                                : Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.subtitle,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isCompleted || isCurrent
                                ? Colors.grey.shade600
                                : Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFF1F9F1), Color(0xFFE8F5E9)]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.success.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          const Text('How was the resolution?',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeedbackBtn(
                  Icons.sentiment_very_dissatisfied_rounded, 'Poor'),
              _buildFeedbackBtn(Icons.sentiment_neutral_rounded, 'OK'),
              _buildFeedbackBtn(
                  Icons.sentiment_very_satisfied_rounded, 'Great'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackBtn(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(icon, size: 32, color: AppColors.success)),
        Text(label,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.success)),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
      child: Row(
        children: [
          Container(
              width: 4,
              height: 18,
              decoration: BoxDecoration(
                  color: AppColors.saffron,
                  borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 10),
          Text(title,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1)),
        ],
      ),
    );
  }

  bool _isStepCompleted(int index) {
    return index < grievance.status.index;
  }

  bool _isCurrentStep(int index) {
    return index == grievance.status.index;
  }

  Color _getStatusColor(GrievanceStatus status) {
    switch (status) {
      case GrievanceStatus.pending:
        return Colors.grey;
      case GrievanceStatus.allocating:
        return AppColors.blueDark;
      case GrievanceStatus.inProgress:
        return AppColors.warning;
      case GrievanceStatus.actionTaken:
        return AppColors.primary;
      case GrievanceStatus.resolved:
        return AppColors.success;
    }
  }
}

class _WorkflowStep {
  final String title;
  final String subtitle;
  final GrievanceStatus status;
  _WorkflowStep(this.title, this.subtitle, this.status);
}
