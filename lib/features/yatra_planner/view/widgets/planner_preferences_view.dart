import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:yatramitra/shared/widgets/yatra_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/yatra_section_header.dart';
import '../../viewmodel/yatra_planner_viewmodel.dart';
import 'planner_widgets.dart';

/// View for gathering user preferences.
class PlannerPreferencesView extends ConsumerWidget {
  final YatraPlannerState state;

  const PlannerPreferencesView({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YatraSectionHeader(title: 'Plan Your Journey'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Customize your Char Dham pilgrimage with AI-powered optimization.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _PreferencesForm(),
          ),
        ],
      ),
    );
  }
}

class _PreferencesForm extends ConsumerStatefulWidget {
  const _PreferencesForm();

  @override
  ConsumerState<_PreferencesForm> createState() => _PreferencesFormState();
}

class _PreferencesFormState extends ConsumerState<_PreferencesForm> {
  DateTime _startDate = DateTime.now().add(const Duration(days: 30));
  int _durationDays = 5;
  String _startFrom = 'Rishikesh';
  final List<String> _selectedDhams = ['Kedarnath'];
  String _ageGroup = '18–40 (Active)';
  String _fitnessLevel = 'High (Regular trekker)';
  String _accommodationType = 'Government (GMVN/UTDB)';
  String _budgetRange = '₹5,000–₹10,000';
  final TextEditingController _specialNeedsController = TextEditingController();

  final List<String> _allDhams = [
    'Yamunotri',
    'Gangotri',
    'Kedarnath',
    'Badrinath',
    'Char Dham (All 4)'
  ];
  final List<String> _startLocations = [
    'Rishikesh',
    'Haridwar',
    'Dehradun',
    'Delhi'
  ];
  final List<String> _ageGroups = [
    '18–40 (Active)',
    '40–60 (Moderate)',
    '60+ (Senior)'
  ];
  final List<String> _fitnessLevels = [
    'High (Regular trekker)',
    'Moderate (Occasional walker)',
    'Low (Need assistance)'
  ];
  final List<String> _accommodationTypes = [
    'Government (GMVN/UTDB)',
    'Private Hotel',
    'Luxury Resort'
  ];
  final List<String> _budgetRanges = [
    '₹5,000–₹10,000',
    '₹10,000–₹25,000',
    '₹25,000+'
  ];

  @override
  void dispose() {
    _specialNeedsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PreferenceField(
          label: 'Start Date',
          icon: Icons.calendar_month_outlined,
          onTap: _pickDate,
          child: Row(
            children: [
              Text(DateFormat('dd MMM yyyy').format(_startDate),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.edit_outlined, size: 16, color: Colors.grey),
            ],
          ),
        ),
        _buildDropdown('Duration (Days)', '$_durationDays Days', (val) {
          setState(() => _durationDays = int.parse(val!.split(' ')[0]));
        }, ['3 Days', '5 Days', '7 Days', '10 Days', '15 Days'],
            Icons.access_time_rounded),
        _buildDropdown(
            'Start From',
            _startFrom,
            (val) => setState(() => _startFrom = val!),
            _startLocations,
            Icons.location_on_rounded),
        _buildDropdown('Dhams to Cover', _selectedDhams.join(', '), (val) {
          setState(() {
            if (!_selectedDhams.contains(val)) _selectedDhams.add(val!);
          });
        }, _allDhams, Icons.temple_hindu_rounded),
        _buildDropdown(
            'Age Group',
            _ageGroup,
            (val) => setState(() => _ageGroup = val!),
            _ageGroups,
            Icons.people_alt_rounded),
        _buildDropdown(
            'Physical Fitness',
            _fitnessLevel,
            (val) => setState(() => _fitnessLevel = val!),
            _fitnessLevels,
            Icons.favorite_rounded),
        _buildDropdown(
            'Accommodation Type',
            _accommodationType,
            (val) => setState(() => _accommodationType = val!),
            _accommodationTypes,
            Icons.hotel_rounded),
        _buildDropdown(
            'Budget Per Person',
            _budgetRange,
            (val) => setState(() => _budgetRange = val!),
            _budgetRanges,
            Icons.payments_rounded),
        PreferenceField(
          label: 'Special Needs (Optional)',
          icon: Icons.accessibility_new_rounded,
          child: TextField(
            controller: _specialNeedsController,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'None'),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 32),
        PlannerButton(
          text: 'Generate AI Itinerary',
          onPressed: _onGenerate,
        ),
        const SizedBox(height: 12),
        PlannerButton(
          text: 'Save Preferences',
          onPressed: () {},
          isPrimary: false,
        ),
        const SizedBox(height: 40),
        const _OptimizationFactors(),
      ],
    );
  }

  Widget _buildDropdown(String label, String value, Function(String?) onChanged,
      List<String> items, IconData icon) {
    return PreferenceField(
      label: label,
      icon: icon,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: items.contains(value) ? value : items.first,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          onChanged: onChanged,
          items: items
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _startDate = picked);
  }

  void _onGenerate() {
    ref.read(yatraPlannerViewModelProvider.notifier).generateItinerary(
          dhamName: _selectedDhams.first,
          startDate: _startDate,
          durationDays: _durationDays,
          startFrom: _startFrom,
          dhamsToCover: _selectedDhams,
          ageGroup: _ageGroup,
          fitnessLevel: _fitnessLevel,
          accommodationType: _accommodationType,
          budgetRange: _budgetRange,
          specialNeeds: _specialNeedsController.text,
        );
  }
}

class _OptimizationFactors extends StatelessWidget {
  const _OptimizationFactors();

  @override
  Widget build(BuildContext context) {
    final factors = [
      'Crowd prediction & avoidance',
      'Weather forecast integration',
      'Health & fitness safety',
      'Travel time optimization',
      'Accommodation availability'
    ];
    return YatraCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_fix_high_rounded, color: Colors.green, size: 18),
              SizedBox(width: 8),
              Text('AI Optimization Factors',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          ...factors.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    const Icon(Icons.check, size: 14, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(f,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
