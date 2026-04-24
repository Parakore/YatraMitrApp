import 'package:freezed_annotation/freezed_annotation.dart';

part 'sos_incident.freezed.dart';
part 'sos_incident.g.dart';

@freezed
class SosIncident with _$SosIncident {
  const factory SosIncident({
    required String id,
    required String pilgrim,
    required String type,
    required String location,
    required String time,
    required String responseTime,
    required String agency,
    required String status,
  }) = _SosIncident;

  factory SosIncident.fromJson(Map<String, dynamic> json) => _$SosIncidentFromJson(json);
}

@freezed
class EmergencyWorkflowStep with _$EmergencyWorkflowStep {
  const factory EmergencyWorkflowStep({
    required String title,
    required String icon,
    required String desc,
    @Default(false) bool active,
  }) = _EmergencyWorkflowStep;

  factory EmergencyWorkflowStep.fromJson(Map<String, dynamic> json) => _$EmergencyWorkflowStepFromJson(json);
}
