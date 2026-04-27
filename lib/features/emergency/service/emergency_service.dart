import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/sos_incident.dart';

/// Provider for Emergency Service
final emergencyServiceProvider = Provider((ref) => EmergencyService());

/// Service for Emergency data fetching.
/// In a production app, this would use Dio for API and Hive for Local Storage.
class EmergencyService {
  Future<List<Map<String, String>>> getEmergencyContacts() async {
    // Mocking API delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      {'label': 'Ambulance / SDRF', 'number': '112'},
      {'label': 'Kedarnath Medical Camp', 'number': '+91 135-2713600'},
      {'label': 'Tourist Police Helpline', 'number': '1364'},
      {'label': 'Disaster Control Room', 'number': '1070'},
      {'label': 'Emergency Contact (Sanjay Sharma)', 'number': '+91 99XXXXXXXX'},
    ];
  }

  Future<List<SosIncident>> getRecentIncidents() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      const SosIncident(
        id: 'SOS-2025-0045',
        pilgrim: 'Aditya Mehra (M,42)',
        type: 'Fainting',
        location: 'Kedar Dome (14km)',
        time: '11:15 AM',
        responseTime: '5 mins',
        agency: 'Paramedics',
        status: 'Resolved',
      ),
      const SosIncident(
        id: 'SOS-2025-0044',
        pilgrim: 'Savitri Devi (F,65)',
        type: 'Respiratory Distress',
        location: 'Base Camp (16km)',
        time: '10:45 AM',
        responseTime: '3 mins',
        agency: 'Medical Center',
        status: 'Active',
      ),
      const SosIncident(
        id: 'SOS-2025-0043',
        pilgrim: 'Vikas Jha (M,29)',
        type: 'Dehydration',
        location: 'Rambara (8.5km)',
        time: '09:20 AM',
        responseTime: '7 mins',
        agency: 'Water Point + Med',
        status: 'Resolved',
      ),
      const SosIncident(
        id: 'SOS-2025-0042',
        pilgrim: 'Anjali Verma (F,24)',
        type: 'Panic Attack',
        location: 'Gaurikund',
        time: '08:50 AM',
        responseTime: '4 mins',
        agency: 'Police Unit',
        status: 'Resolved',
      ),
      const SosIncident(
        id: 'SOS-2025-0041',
        pilgrim: 'Meena Devi (F,58)',
        type: 'Medical',
        location: 'Rambara (8.5km)',
        time: '07:22 AM',
        responseTime: '6 mins',
        agency: 'SDRF + Medical',
        status: 'Resolved',
      ),
      const SosIncident(
        id: 'SOS-2025-0040',
        pilgrim: 'Rajesh Gupta (M,66)',
        type: 'Altitude Sickness',
        location: 'Linchauri (11km)',
        time: '06:48 AM',
        responseTime: '8 mins',
        agency: 'Medical Camp',
        status: 'Resolved',
      ),
      const SosIncident(
        id: 'SOS-2025-0039',
        pilgrim: 'Priya Singh (F,34)',
        type: 'Ankle Injury',
        location: 'Bhimbali (5km)',
        time: '14:10',
        responseTime: '11 mins',
        agency: 'Porter + Medical',
        status: 'Resolved',
      ),
      const SosIncident(
        id: 'SOS-2025-0038',
        pilgrim: 'Deepak Verma (M,55)',
        type: 'Chest Pain',
        location: 'Gaurikund Base',
        time: '09:30',
        responseTime: '4 mins',
        agency: 'Ambulance + AIIMS',
        status: 'Resolved',
      ),
    ];
  }

  Future<List<EmergencyWorkflowStep>> getWorkflowSteps() async {
    return [
      const EmergencyWorkflowStep(title: 'SOS Triggered', icon: '📱', desc: 'Location + Profile auto-shared'),
      const EmergencyWorkflowStep(title: 'AI Classification', icon: '🤖', desc: 'Medical / Accident / Disaster'),
      const EmergencyWorkflowStep(title: 'Unit Dispatched', icon: '🚑', desc: 'Ambulance / Police / SDRF'),
      const EmergencyWorkflowStep(title: 'Live Tracking', icon: '📡', desc: 'Real-time rescue team map'),
      const EmergencyWorkflowStep(title: 'Treatment / Rescue', icon: '🏥', desc: 'Hospital notified en route'),
      const EmergencyWorkflowStep(title: 'Case Closure', icon: '✅', desc: 'Report + feedback loop'),
    ];
  }
}
