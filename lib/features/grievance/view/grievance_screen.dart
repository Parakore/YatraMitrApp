import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../viewmodel/grievance_viewmodel.dart';
import '../model/grievance_model.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Grievance Redressal',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            const Text(
              'Select Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildCategoryGrid(state.categories),
            const SizedBox(height: 24),
            const Text(
              'Describe the Issue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            _buildDescriptionField(),
            const SizedBox(height: 32),
            _buildSubmitButton(state.isLoading),
            if (state.grievances.isNotEmpty) ...[
              const SizedBox(height: 40),
              const Text(
                'Recent Submissions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              _buildRecentGrievances(state.grievances),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.blueDark, AppColors.blueDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.blueDark.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.support_agent_rounded, size: 48, color: Colors.white),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How can we help?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Report issues to authorities instantly',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
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
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = _selectedCategory == category.name;

        return GestureDetector(
          onTap: () => setState(() => _selectedCategory = category.name),
          child: Container(
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
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  color: isSelected ? Colors.white : category.color,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: _descriptionController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Describe the problem in detail...',
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: isLoading ? null : _submit,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueDark,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Submit Grievance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
      ),
    );
  }

  Widget _buildRecentGrievances(List<Grievance> grievances) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: grievances.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final g = grievances[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_outline,
                    color: AppColors.success),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      g.category,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      g.description,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                'SUBMITTED',
                style: TextStyle(
                  color: AppColors.success,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
