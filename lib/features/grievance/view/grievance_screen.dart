import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/yatra_app_bar.dart';
import '../../../shared/widgets/yatra_section_header.dart';
import '../viewmodel/grievance_viewmodel.dart';
import '../model/grievance_model.dart';
import '../../../core/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../core/services/permission_service.dart';

class GrievanceScreen extends ConsumerStatefulWidget {
  const GrievanceScreen({super.key});

  @override
  ConsumerState<GrievanceScreen> createState() => _GrievanceScreenState();
}

class _GrievanceScreenState extends ConsumerState<GrievanceScreen> {
  final _descriptionController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final permissionService = ref.read(permissionServiceProvider.notifier);

    // Show selection dialog
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded,
                  color: AppColors.primary),
              title: const Text('Take Photo',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_rounded,
                  color: AppColors.primary),
              title: const Text('Choose from Gallery',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );

    if (source == null) return;

    // Check permissions
    bool hasPermission = false;
    if (source == ImageSource.camera) {
      hasPermission = await permissionService.requestCameraPermission();
    } else {
      hasPermission = await permissionService.requestGalleryPermission();
    }

    if (!hasPermission) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Permission denied. Please enable it in settings.')),
        );
      }
      return;
    }

    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      imageQuality: 70, // Optimize for upload
    );

    if (image != null) {
      ref.read(grievanceViewModelProvider.notifier).setPickedImage(image.path);
    }
  }

  void _submit() async {
    if (_selectedCategory == null || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select a category and add details')),
      );
      return;
    }

    await ref.read(grievanceViewModelProvider.notifier).submitGrievance(
          _selectedCategory!,
          _descriptionController.text,
        );

    if (mounted) {
      _descriptionController.clear();
      setState(() => _selectedCategory = null);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Grievance submitted successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(grievanceViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const YatraAppBar(
        title: 'Grievance Redressal',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuickStats(state.grievances),
            const YatraSectionHeader(title: 'FILE NEW COMPLAINT'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildGeoEvidenceCard(),
                  const SizedBox(height: 16),
                  _buildCategoryGrid(state.categories),
                  const SizedBox(height: 20),
                  _buildDescriptionField(),
                  const SizedBox(height: 24),
                  _buildSubmitButton(state.isLoading),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const YatraSectionHeader(title: 'MY COMPLAINTS'),
            _buildMyComplaintsList(state.grievances),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }


  Widget _buildQuickStats(List<Grievance> grievances) {
    final openCount =
        grievances.where((g) => g.status != GrievanceStatus.resolved).length;
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem('Open', '$openCount', AppColors.warning),
          Container(width: 1, height: 30, color: Colors.grey.shade300),
          _buildStatItem('Resolved', '${grievances.length - openCount}',
              AppColors.success),
          Container(width: 1, height: 30, color: Colors.grey.shade300),
          _buildStatItem('SLA Met', '98%', AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label,
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                color: color, fontSize: 18, fontWeight: FontWeight.w900)),
      ],
    );
  }

  Widget _buildGeoEvidenceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_rounded,
                  color: AppColors.primary, size: 20),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Auto Geo-Tagging Active',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.gps_fixed, size: 10, color: AppColors.success),
                    SizedBox(width: 4),
                    Text('SECURE',
                        style: TextStyle(
                            color: AppColors.success,
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Consumer(
            builder: (context, ref, child) {
              final pickedImage = ref.watch(
                  grievanceViewModelProvider.select((s) => s.pickedImagePath));
              return Container(
                height: pickedImage != null ? 120 : 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      style: pickedImage != null
                          ? BorderStyle.solid
                          : BorderStyle.none),
                  image: pickedImage != null
                      ? DecorationImage(
                          image: FileImage(File(pickedImage)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _pickImage,
                    borderRadius: BorderRadius.circular(12),
                    child: pickedImage != null
                        ? Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.cancel, color: Colors.red),
                              onPressed: () => ref
                                  .read(grievanceViewModelProvider.notifier)
                                  .setPickedImage(null),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo_rounded,
                                  color: Colors.grey.shade600, size: 24),
                              const SizedBox(width: 10),
                              Text('Upload Photo Evidence',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(List<GrievanceCategory> categories) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = _selectedCategory == category.name;
        return GestureDetector(
          onTap: () => setState(() => _selectedCategory = category.name),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? category.color : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? category.color : Colors.grey.shade200,
                width: 2,
              ),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                      color: category.color.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category.icon,
                    color: isSelected ? Colors.white : category.color,
                    size: 28),
                const SizedBox(height: 8),
                Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        controller: _descriptionController,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: 'Provide specific details for faster resolution...',
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : _submit,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D1B2A),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2))
            : const Text('Submit Complaint',
                style:
                    TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.1)),
      ),
    );
  }

  Widget _buildMyComplaintsList(List<Grievance> grievances) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: grievances.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final g = grievances[index];
        return _buildGrievanceCard(g);
      },
    );
  }

  Widget _buildGrievanceCard(Grievance g) {
    final statusColor = _getStatusColor(g.status);
    return GestureDetector(
        onTap: () => context.push(AppRouter.grievanceDetail, extra: g),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4))
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(g.id,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppColors.primary)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            g.status.name.toUpperCase(),
                            style: TextStyle(
                                color: statusColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(_getCategoryIcon(g.category),
                              size: 18, color: AppColors.textSecondary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(g.description,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 2),
                              Text('${g.category} • ${g.geoTag ?? 'Unknown'}',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 11)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(16)),
                  border: Border(top: BorderSide(color: Colors.grey.shade100)),
                ),
                child: Row(
                  children: [
                    _buildCardDetail(Icons.business_center_outlined,
                        g.department ?? 'Assigning...'),
                    const Spacer(),
                    _buildCardDetail(
                        Icons.timer_outlined, g.sla ?? 'Calculating...'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildCardDetail(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 6),
        Text(value,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700)),
      ],
    );
  }

  Color _getStatusColor(GrievanceStatus status) {
    switch (status) {
      case GrievanceStatus.pending:
        return AppColors.textSecondary;
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

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Sanitation':
        return Icons.delete_outline_rounded;
      case 'Medical':
        return Icons.medical_services_outlined;
      case 'Overcharging':
        return Icons.payments_outlined;
      case 'Road Block':
        return Icons.traffic_outlined;
      case 'Water Supply':
        return Icons.water_drop_outlined;
      case 'Security':
        return Icons.security_outlined;
      default:
        return Icons.help_outline_rounded;
    }
  }
}
