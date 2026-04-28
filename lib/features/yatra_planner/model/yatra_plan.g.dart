// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yatra_plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YatraPlanAdapter extends TypeAdapter<_$YatraPlanImpl> {
  @override
  final int typeId = 1;

  @override
  _$YatraPlanImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$YatraPlanImpl(
      id: fields[0] as String,
      dhamName: fields[1] as String,
      startDate: fields[2] as DateTime,
      durationDays: fields[3] as int,
      startFrom: fields[4] as String,
      dhamsToCover: (fields[5] as List).cast<String>(),
      ageGroup: fields[6] as String,
      fitnessLevel: fields[7] as String,
      accommodationType: fields[8] as String,
      budgetRange: fields[9] as String,
      specialNeeds: fields[10] as String?,
      itinerary: (fields[11] as List?)?.cast<YatraDayPlan>(),
      status: fields[12] as String,
      createdAt: fields[13] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$YatraPlanImpl obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dhamName)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.durationDays)
      ..writeByte(4)
      ..write(obj.startFrom)
      ..writeByte(6)
      ..write(obj.ageGroup)
      ..writeByte(7)
      ..write(obj.fitnessLevel)
      ..writeByte(8)
      ..write(obj.accommodationType)
      ..writeByte(9)
      ..write(obj.budgetRange)
      ..writeByte(10)
      ..write(obj.specialNeeds)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.dhamsToCover)
      ..writeByte(11)
      ..write(obj.itinerary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YatraPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class YatraDayPlanAdapter extends TypeAdapter<_$YatraDayPlanImpl> {
  @override
  final int typeId = 2;

  @override
  _$YatraDayPlanImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$YatraDayPlanImpl(
      dayNumber: fields[0] as int,
      date: fields[1] as DateTime,
      route: fields[2] as String,
      distance: fields[3] as String,
      transport: fields[4] as String,
      accommodation: fields[5] as String,
      weather: fields[6] as String,
      crowdForecast: fields[7] as String,
      aiTip: fields[8] as String,
      riskLevel: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$YatraDayPlanImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.dayNumber)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.route)
      ..writeByte(3)
      ..write(obj.distance)
      ..writeByte(4)
      ..write(obj.transport)
      ..writeByte(5)
      ..write(obj.accommodation)
      ..writeByte(6)
      ..write(obj.weather)
      ..writeByte(7)
      ..write(obj.crowdForecast)
      ..writeByte(8)
      ..write(obj.aiTip)
      ..writeByte(9)
      ..write(obj.riskLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YatraDayPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YatraPlanImpl _$$YatraPlanImplFromJson(Map<String, dynamic> json) =>
    _$YatraPlanImpl(
      id: json['id'] as String,
      dhamName: json['dhamName'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      durationDays: (json['durationDays'] as num).toInt(),
      startFrom: json['startFrom'] as String,
      dhamsToCover: (json['dhamsToCover'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ageGroup: json['ageGroup'] as String,
      fitnessLevel: json['fitnessLevel'] as String,
      accommodationType: json['accommodationType'] as String,
      budgetRange: json['budgetRange'] as String,
      specialNeeds: json['specialNeeds'] as String?,
      itinerary: (json['itinerary'] as List<dynamic>?)
          ?.map((e) => YatraDayPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String? ?? 'Planned',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$YatraPlanImplToJson(_$YatraPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dhamName': instance.dhamName,
      'startDate': instance.startDate.toIso8601String(),
      'durationDays': instance.durationDays,
      'startFrom': instance.startFrom,
      'dhamsToCover': instance.dhamsToCover,
      'ageGroup': instance.ageGroup,
      'fitnessLevel': instance.fitnessLevel,
      'accommodationType': instance.accommodationType,
      'budgetRange': instance.budgetRange,
      'specialNeeds': instance.specialNeeds,
      'itinerary': instance.itinerary,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$YatraDayPlanImpl _$$YatraDayPlanImplFromJson(Map<String, dynamic> json) =>
    _$YatraDayPlanImpl(
      dayNumber: (json['dayNumber'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      route: json['route'] as String,
      distance: json['distance'] as String,
      transport: json['transport'] as String,
      accommodation: json['accommodation'] as String,
      weather: json['weather'] as String,
      crowdForecast: json['crowdForecast'] as String,
      aiTip: json['aiTip'] as String,
      riskLevel: json['riskLevel'] as String? ?? 'Low',
    );

Map<String, dynamic> _$$YatraDayPlanImplToJson(_$YatraDayPlanImpl instance) =>
    <String, dynamic>{
      'dayNumber': instance.dayNumber,
      'date': instance.date.toIso8601String(),
      'route': instance.route,
      'distance': instance.distance,
      'transport': instance.transport,
      'accommodation': instance.accommodation,
      'weather': instance.weather,
      'crowdForecast': instance.crowdForecast,
      'aiTip': instance.aiTip,
      'riskLevel': instance.riskLevel,
    };
