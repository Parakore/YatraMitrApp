import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../model/home_models.dart';

/// Dynamic detail screen for Travel Essentials.
/// Renders different layouts based on the EssentialCategory.
class EssentialDetailScreen extends StatelessWidget {
  final TravelEssential essential;
  final TravelEssentialDetail details;

  const EssentialDetailScreen({
    super.key,
    required this.essential,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.surface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          essential.title.replaceAll('\n', ' '),
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0D1B2A),
                Color(0xFF1A3A6B),
              ],
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
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          color: AppColors.primary.withValues(alpha: 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Overview'),
              const SizedBox(height: 12),
              Text(
                details.description,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textPrimary.withValues(alpha: 0.8),
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              if (essential.category == EssentialCategory.packing)
                _buildPackingChecklist()
              else
                _buildStandardSections(),
            ],
          ),
        ),
      ),

      // body: CustomScrollView(
      //   slivers: [
      //     _buildSliverAppBar(context),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: const EdgeInsets.all(24.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             _buildSectionHeader('Overview'),
      //             const SizedBox(height: 12),
      //             Text(
      //               details.description,
      //               style: TextStyle(
      //                 fontSize: 15,
      //                 color: AppColors.textPrimary.withValues(alpha: 0.8),
      //                 height: 1.6,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             const SizedBox(height: 32),
      //             if (essential.category == EssentialCategory.packing)
      //               _buildPackingChecklist()
      //             else
      //               _buildStandardSections(),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
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
    );
  }

  Widget _buildStandardSections() {
    return Column(
      children: details.sections.map((section) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: (section.accentColor ?? AppColors.primary)
                          .withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      section.icon,
                      color: section.accentColor ?? AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      section.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                section.content,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary.withValues(alpha: 0.7),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPackingChecklist() {
    if (details.checklist == null) return const SizedBox.shrink();

    // Group items by category
    final Map<String, List<ChecklistItem>> groupedItems = {};
    for (var item in details.checklist!) {
      groupedItems.putIfAbsent(item.category, () => []).add(item);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedItems.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                entry.key.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textSecondary.withValues(alpha: 0.6),
                  letterSpacing: 1.0,
                ),
              ),
            ),
            ...entry.value.map((item) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CheckboxListTile(
                  value: item.isChecked,
                  onChanged: (val) {},
                  title: Text(
                    item.item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary,
                    ),
                  ),
                  subtitle: item.isRequired
                      ? const Text(
                          'MANDATORY',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.error,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      : null,
                  activeColor: AppColors.primary,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              );
            }),
            const SizedBox(height: 8),
          ],
        );
      }).toList(),
    );
  }
}
