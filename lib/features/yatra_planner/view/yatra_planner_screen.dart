import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/error_widget.dart';
import '../viewmodel/yatra_planner_viewmodel.dart';
import '../model/yatra_plan.dart';

/// High-fidelity Yatra Planner screen.
/// Implements the comprehensive design from yatra_planner.png.
class YatraPlannerScreen extends ConsumerStatefulWidget {
  const YatraPlannerScreen({super.key});

  @override
  ConsumerState<YatraPlannerScreen> createState() => _YatraPlannerScreenState();
}

class _YatraPlannerScreenState extends ConsumerState<YatraPlannerScreen> {
  // Form State
  DateTime _startDate = DateTime.now().add(const Duration(days: 30));
  int _durationDays = 5;
  String _startFrom = 'Rishikesh';
  final List<String> _selectedDhams = ['Kedarnath'];
  String _ageGroup = '18–40 (Active)';
  String _fitnessLevel = 'High (Regular trekker)';
  String _accommodationType = 'Government (GMVN/UTDB)';
  String _budgetRange = '₹5,000–₹10,000';
  final TextEditingController _specialNeedsController = TextEditingController();

  // Reference Data
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
    final state = ref.watch(yatraPlannerViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('YatraMitra',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: state.when(
        data: (plannerState) => _buildBody(plannerState),
        loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.saffron)),
        error: (err, stack) => AppErrorWidget(
          errorMessage: 'Error: $err',
          onRetry: () => ref.invalidate(yatraPlannerViewModelProvider),
        ),
      ),
    );
  }

  Widget _buildBody(YatraPlannerState state) {
    if (state.isGenerating) {
      return _buildWorkflowView(state.workflowStep);
    }

    // If there's a plan with an itinerary, show the result view
    final latestPlan = state.plans.isNotEmpty ? state.plans.first : null;
    if (latestPlan != null && latestPlan.itinerary != null) {
      return _buildItineraryView(latestPlan);
    }

    return _buildPreferencesForm();
  }

  // --- 1. Preferences Form View ---
  Widget _buildPreferencesForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Yatra Preferences'),
          const SizedBox(height: 24),
          _buildDateField(
              'Start Date', _startDate, (d) => setState(() => _startDate = d)),
          _buildDropdownField(
              'Duration (Days)',
              '$_durationDays Days',
              (val) =>
                  setState(() => _durationDays = int.parse(val!.split(' ')[0])),
              ['3 Days', '5 Days', '7 Days', '10 Days', '15 Days']),
          _buildDropdownField('Start From', _startFrom,
              (val) => setState(() => _startFrom = val!), _startLocations),
          _buildDropdownField('Dhams to Cover', _selectedDhams.join(', '),
              (val) {
            setState(() {
              if (!_selectedDhams.contains(val)) _selectedDhams.add(val!);
            });
          }, _allDhams),
          _buildDropdownField('Age Group', _ageGroup,
              (val) => setState(() => _ageGroup = val!), _ageGroups),
          _buildDropdownField('Physical Fitness', _fitnessLevel,
              (val) => setState(() => _fitnessLevel = val!), _fitnessLevels),
          _buildDropdownField(
              'Accommodation Type',
              _accommodationType,
              (val) => setState(() => _accommodationType = val!),
              _accommodationTypes),
          _buildDropdownField('Budget Per Person', _budgetRange,
              (val) => setState(() => _budgetRange = val!), _budgetRanges),
          _buildTextField('Special Needs (Optional)', _specialNeedsController),
          const SizedBox(height: 32),
          _buildPrimaryButton('Generate AI Itinerary', () {
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
          }),
          const SizedBox(height: 12),
          _buildSecondaryButton('Save Preferences', () {}),
          const SizedBox(height: 40),
          _buildOptimizationFactors(),
        ],
      ),
    );
  }

  // --- 2. Workflow / Generation View ---
  Widget _buildWorkflowView(int currentStep) {
    final steps = [
      'Reg. & Profile',
      'Health Screening',
      'AI Route Optimization',
      'Crowd & Weather',
      'Booking & Confirm',
      'Live Tracking'
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome_rounded,
                size: 64, color: AppColors.saffron),
            const SizedBox(height: 32),
            const Text(
              'AI Planning Workflow',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ...List.generate(steps.length, (index) {
              final stepNum = index + 1;
              final isActive = stepNum <= currentStep;
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color:
                            isActive ? AppColors.saffron : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isActive
                            ? const Icon(Icons.check,
                                size: 16, color: Colors.white)
                            : Text('$stepNum',
                                style: const TextStyle(color: Colors.grey)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      steps[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? AppColors.textPrimary : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // --- 3. Itinerary Result View ---
  Widget _buildItineraryView(YatraPlan plan) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AI-Generated Itinerary',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('${plan.dhamName} ${plan.durationDays} Days',
                      style: const TextStyle(
                          color: AppColors.textSecondary, fontSize: 14)),
                ],
              ),
              _buildOptimizedPill(),
            ],
          ),
          const SizedBox(height: 24),
          ...plan.itinerary!.map((day) => _buildDayCard(day)),
          const SizedBox(height: 32),
          _buildPrimaryButton('Re-Generate AI Itinerary', () {
            ref
                .read(yatraPlannerViewModelProvider.notifier)
                .removePlan(plan.id);
          }),
        ],
      ),
    );
  }

  // --- UI Components ---

  Widget _buildHeader(String title) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildDateField(
      String label, DateTime value, Function(DateTime) onPicked) {
    return _buildFieldContainer(
      label,
      Row(
        children: [
          const Icon(Icons.calendar_month_outlined,
              size: 18, color: Colors.grey),
          const SizedBox(width: 12),
          Text(DateFormat('dd MMM yyyy').format(value),
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.edit_outlined, size: 16, color: Colors.grey),
        ],
      ),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (picked != null) onPicked(picked);
      },
    );
  }

  Widget _buildDropdownField(String label, String value,
      Function(String?) onChanged, List<String> items) {
    return _buildFieldContainer(
      label,
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: items.contains(value) ? value : items.first,
          isExpanded: true,
          icon:
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          onChanged: onChanged,
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return _buildFieldContainer(
      label,
      TextField(
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'None',
            hintStyle: TextStyle(color: Colors.grey)),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFieldContainer(String label, Widget child,
      {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(_getIconForLabel(label), size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(label,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    if (label.contains('Date')) return Icons.calendar_today_rounded;
    if (label.contains('Duration')) return Icons.access_time_rounded;
    if (label.contains('Start From')) return Icons.location_on_rounded;
    if (label.contains('Dham')) return Icons.temple_hindu_rounded;
    if (label.contains('Age')) return Icons.people_alt_rounded;
    if (label.contains('Fitness')) return Icons.favorite_rounded;
    if (label.contains('Accommodation')) return Icons.hotel_rounded;
    if (label.contains('Budget')) return Icons.payments_rounded;
    return Icons.accessibility_new_rounded;
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.saffron,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSecondaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary)),
      ),
    );
  }

  Widget _buildOptimizationFactors() {
    final factors = [
      'Crowd prediction & avoidance',
      'Weather forecast integration',
      'Health & fitness safety',
      'Travel time optimization',
      'Accommodation availability'
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
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

  Widget _buildOptimizedPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.green.shade50, borderRadius: BorderRadius.circular(20)),
      child: const Row(
        children: [
          Icon(Icons.auto_awesome, color: Colors.green, size: 14),
          SizedBox(width: 4),
          Text('AI Optimized',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDayCard(YatraDayPlan day) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade100)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    'Day ${day.dayNumber} • ${DateFormat('dd MMM').format(day.date)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const Spacer(),
                _buildRiskPill(day.riskLevel),
              ],
            ),
            const SizedBox(height: 16),
            Text(day.route,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.directions_bus_rounded,
                    size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text('${day.distance} • ${day.transport}',
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoRow(
                Icons.hotel_rounded, 'Accommodation', day.accommodation),
            _buildInfoRow(Icons.wb_sunny_rounded, 'Weather', day.weather),
            _buildInfoRow(
                Icons.groups_rounded, 'Crowd Forecast', day.crowdForecast,
                color: _getRiskColor(day.riskLevel)),
            const Divider(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.tips_and_updates_rounded,
                    color: Color(0xFFF97316), size: 18),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('AI Tip',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(day.aiTip,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFFF97316)),
          const SizedBox(width: 12),
          Text('$label:',
              style: const TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(width: 8),
          Text(value,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: color ?? AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildRiskPill(String level) {
    final color = _getRiskColor(level);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6)),
      child: Text(level,
          style: TextStyle(
              color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }

  Color _getRiskColor(String level) {
    switch (level.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'moderate':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildBottomNav() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, 'Home', false),
          _navItem(Icons.calendar_today_rounded, 'Planner', true),
          _navItem(Icons.map_outlined, 'Itinerary', false),
          _navItem(Icons.book_online_outlined, 'Bookings', false),
          _navItem(Icons.more_horiz_rounded, 'More', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? AppColors.saffron : Colors.grey, size: 24),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                color: isActive ? AppColors.saffron : Colors.grey,
                fontSize: 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
