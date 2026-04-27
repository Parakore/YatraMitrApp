import 'package:flutter/material.dart';
import 'package:yatramitra/core/theme/app_colors.dart';

class EmergencyCategories extends StatelessWidget {
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  const EmergencyCategories({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'label': 'Medical',
        'icon': Icons.medical_services_rounded,
        'color': Colors.red.shade400,
        'bg': Colors.red.shade50
      },
      {
        'label': 'Accident',
        'icon': Icons.car_crash_rounded,
        'color': Colors.orange.shade400,
        'bg': Colors.orange.shade50
      },
      {
        'label': 'Landslide',
        'icon': Icons.terrain_rounded,
        'color': Colors.brown.shade400,
        'bg': Colors.brown.shade50
      },
      {
        'label': 'Flash Flood',
        'icon': Icons.flood_rounded,
        'color': Colors.blue.shade400,
        'bg': Colors.blue.shade50
      },
      {
        'label': 'Missing',
        'icon': Icons.person_search_rounded,
        'color': Colors.purple.shade400,
        'bg': Colors.purple.shade50
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = selectedCategory == cat['label'];

              return _CategoryCard(
                label: cat['label'] as String,
                icon: cat['icon'] as IconData,
                iconColor: cat['color'] as Color,
                bgColor: cat['bg'] as Color,
                isSelected: isSelected,
                onTap: () => onCategorySelected(cat['label'] as String),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: 100,
      child: Material(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: isSelected ? 8 : 1,
        shadowColor:
            isSelected ? AppColors.primary.withOpacity(0.4) : Colors.black12,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade200,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white.withOpacity(0.2) : bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? Colors.white : iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                    color: isSelected ? Colors.white : AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
