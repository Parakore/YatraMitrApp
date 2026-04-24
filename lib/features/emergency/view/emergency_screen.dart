import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/status_pill.dart';
import '../viewmodel/emergency_viewmodel.dart';
import '../model/sos_incident.dart';

class EmergencyScreen extends ConsumerStatefulWidget {
  const EmergencyScreen({super.key});

  @override
  ConsumerState<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends ConsumerState<EmergencyScreen> {
  Timer? _holdTimer;
  double _holdProgress = 0.0;

  void _startHold() {
    _holdProgress = 0.0;
    _holdTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _holdProgress += 0.01;
        if (_holdProgress >= 1.0) {
          _holdTimer?.cancel();
          _triggerSos();
        }
      });
    });
  }

  void _cancelHold() {
    _holdTimer?.cancel();
    setState(() {
      _holdProgress = 0.0;
    });
  }

  void _triggerSos() {
    ref.read(emergencyProvider.notifier).triggerSos();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('SOS ACTIVATED: Emergency units notified.'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emergencyState = ref.watch(emergencyProvider);

    return Scaffold(
      backgroundColor:
          emergencyState.isSosActive ? const Color(0xFFFDECEA) : Colors.white,
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
        actions: [
          if (emergencyState.isSosActive)
            TextButton(
              onPressed: () => ref.read(emergencyProvider.notifier).cancelSos(),
              child: const Text('CANCEL',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSosSection(emergencyState.isSosActive),
            _buildClassificationCategories(),
            _buildEmergencyContacts(emergencyState.emergencyContacts),
            _buildWorkflowSection(
                emergencyState.workflowSteps, emergencyState.isSosActive),
            _buildRecentIncidentsSection(emergencyState.recentIncidents),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSosSection(bool isActive) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: isActive ? Colors.red.shade800 : Colors.red.shade50,
      ),
      child: Column(
        children: [
          const Text(
            'SOS',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 2),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onLongPressStart: (_) => _startHold(),
            onLongPressEnd: (_) => _cancelHold(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: _holdProgress,
                    strokeWidth: 10,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        isActive ? Colors.yellow : Colors.red),
                  ),
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.yellow : Colors.red.shade800,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(50),
                          blurRadius: 20,
                          spreadRadius: 5),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(isActive ? Icons.emergency : Icons.touch_app,
                            size: 60,
                            color: isActive ? Colors.red : Colors.white),
                        const SizedBox(height: 8),
                        Text(
                          isActive ? 'SOS ACTIVE' : 'HOLD 3s',
                          style: TextStyle(
                            color: isActive ? Colors.red : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            isActive
                ? 'Live location and profile shared with agencies.'
                : 'Hold 3 seconds to activate emergency',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.red.shade900,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassificationCategories() {
    final categories = [
      {'label': 'Medical', 'icon': Icons.medical_services},
      {'label': 'Accident', 'icon': Icons.car_crash},
      {'label': 'Landslide', 'icon': Icons.terrain},
      {'label': 'Flash Flood', 'icon': Icons.flood},
      {'label': 'Missing', 'icon': Icons.person_search},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Category (Optional)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map((cat) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade100,
                              child: Icon(cat['icon'] as IconData,
                                  color: Colors.red),
                            ),
                            const SizedBox(height: 8),
                            Text(cat['label'] as String,
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyContacts(List<Map<String, String>> contacts) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Emergency Hotlines',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          ...contacts.map((contact) => AppCard(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  dense: true,
                  title: Text(contact['label']!,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(contact['number']!),
                  trailing: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.call, color: Colors.white, size: 20),
                  ),
                  onTap: () {},
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildWorkflowSection(
      List<EmergencyWorkflowStep> steps, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('SOS Emergency Workflow',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 20),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final isCompleted = step.active;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            isCompleted ? Colors.green : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(step.icon,
                              style: const TextStyle(fontSize: 20))),
                    ),
                    if (index < steps.length - 1)
                      Container(
                          width: 2,
                          height: 30,
                          color: isCompleted
                              ? Colors.green
                              : Colors.grey.shade200),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(step.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  isCompleted ? Colors.green : Colors.black87)),
                      Text(step.desc,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600)),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRecentIncidentsSection(List<SosIncident> incidents) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('Recent SOS Incidents (24h)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Pilgrim')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Agency')),
                DataColumn(label: Text('Status')),
              ],
              rows: incidents
                  .map((inc) => DataRow(
                        cells: [
                          DataCell(Text(inc.id,
                              style: const TextStyle(fontSize: 10))),
                          DataCell(Text(inc.pilgrim,
                              style: const TextStyle(fontSize: 10))),
                          DataCell(Text(inc.type,
                              style: const TextStyle(fontSize: 10))),
                          DataCell(Text(inc.time,
                              style: const TextStyle(fontSize: 10))),
                          DataCell(Text(inc.agency,
                              style: const TextStyle(fontSize: 10))),
                          DataCell(StatusPill(
                              label: inc.status.toUpperCase(),
                              type: StatusType.safe)),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
