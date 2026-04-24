// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_incident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SosIncidentImpl _$$SosIncidentImplFromJson(Map<String, dynamic> json) =>
    _$SosIncidentImpl(
      id: json['id'] as String,
      pilgrim: json['pilgrim'] as String,
      type: json['type'] as String,
      location: json['location'] as String,
      time: json['time'] as String,
      responseTime: json['responseTime'] as String,
      agency: json['agency'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$SosIncidentImplToJson(_$SosIncidentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pilgrim': instance.pilgrim,
      'type': instance.type,
      'location': instance.location,
      'time': instance.time,
      'responseTime': instance.responseTime,
      'agency': instance.agency,
      'status': instance.status,
    };

_$EmergencyWorkflowStepImpl _$$EmergencyWorkflowStepImplFromJson(
        Map<String, dynamic> json) =>
    _$EmergencyWorkflowStepImpl(
      title: json['title'] as String,
      icon: json['icon'] as String,
      desc: json['desc'] as String,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$$EmergencyWorkflowStepImplToJson(
        _$EmergencyWorkflowStepImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'desc': instance.desc,
      'active': instance.active,
    };
