// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SosIncident _$SosIncidentFromJson(Map<String, dynamic> json) {
  return _SosIncident.fromJson(json);
}

/// @nodoc
mixin _$SosIncident {
  String get id => throw _privateConstructorUsedError;
  String get pilgrim => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get responseTime => throw _privateConstructorUsedError;
  String get agency => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SosIncidentCopyWith<SosIncident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SosIncidentCopyWith<$Res> {
  factory $SosIncidentCopyWith(
          SosIncident value, $Res Function(SosIncident) then) =
      _$SosIncidentCopyWithImpl<$Res, SosIncident>;
  @useResult
  $Res call(
      {String id,
      String pilgrim,
      String type,
      String location,
      String time,
      String responseTime,
      String agency,
      String status});
}

/// @nodoc
class _$SosIncidentCopyWithImpl<$Res, $Val extends SosIncident>
    implements $SosIncidentCopyWith<$Res> {
  _$SosIncidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pilgrim = null,
    Object? type = null,
    Object? location = null,
    Object? time = null,
    Object? responseTime = null,
    Object? agency = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pilgrim: null == pilgrim
          ? _value.pilgrim
          : pilgrim // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String,
      agency: null == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SosIncidentImplCopyWith<$Res>
    implements $SosIncidentCopyWith<$Res> {
  factory _$$SosIncidentImplCopyWith(
          _$SosIncidentImpl value, $Res Function(_$SosIncidentImpl) then) =
      __$$SosIncidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String pilgrim,
      String type,
      String location,
      String time,
      String responseTime,
      String agency,
      String status});
}

/// @nodoc
class __$$SosIncidentImplCopyWithImpl<$Res>
    extends _$SosIncidentCopyWithImpl<$Res, _$SosIncidentImpl>
    implements _$$SosIncidentImplCopyWith<$Res> {
  __$$SosIncidentImplCopyWithImpl(
      _$SosIncidentImpl _value, $Res Function(_$SosIncidentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pilgrim = null,
    Object? type = null,
    Object? location = null,
    Object? time = null,
    Object? responseTime = null,
    Object? agency = null,
    Object? status = null,
  }) {
    return _then(_$SosIncidentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pilgrim: null == pilgrim
          ? _value.pilgrim
          : pilgrim // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String,
      agency: null == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SosIncidentImpl implements _SosIncident {
  const _$SosIncidentImpl(
      {required this.id,
      required this.pilgrim,
      required this.type,
      required this.location,
      required this.time,
      required this.responseTime,
      required this.agency,
      required this.status});

  factory _$SosIncidentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SosIncidentImplFromJson(json);

  @override
  final String id;
  @override
  final String pilgrim;
  @override
  final String type;
  @override
  final String location;
  @override
  final String time;
  @override
  final String responseTime;
  @override
  final String agency;
  @override
  final String status;

  @override
  String toString() {
    return 'SosIncident(id: $id, pilgrim: $pilgrim, type: $type, location: $location, time: $time, responseTime: $responseTime, agency: $agency, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SosIncidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pilgrim, pilgrim) || other.pilgrim == pilgrim) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.agency, agency) || other.agency == agency) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, pilgrim, type, location,
      time, responseTime, agency, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SosIncidentImplCopyWith<_$SosIncidentImpl> get copyWith =>
      __$$SosIncidentImplCopyWithImpl<_$SosIncidentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SosIncidentImplToJson(
      this,
    );
  }
}

abstract class _SosIncident implements SosIncident {
  const factory _SosIncident(
      {required final String id,
      required final String pilgrim,
      required final String type,
      required final String location,
      required final String time,
      required final String responseTime,
      required final String agency,
      required final String status}) = _$SosIncidentImpl;

  factory _SosIncident.fromJson(Map<String, dynamic> json) =
      _$SosIncidentImpl.fromJson;

  @override
  String get id;
  @override
  String get pilgrim;
  @override
  String get type;
  @override
  String get location;
  @override
  String get time;
  @override
  String get responseTime;
  @override
  String get agency;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$SosIncidentImplCopyWith<_$SosIncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmergencyWorkflowStep _$EmergencyWorkflowStepFromJson(
    Map<String, dynamic> json) {
  return _EmergencyWorkflowStep.fromJson(json);
}

/// @nodoc
mixin _$EmergencyWorkflowStep {
  String get title => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmergencyWorkflowStepCopyWith<EmergencyWorkflowStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyWorkflowStepCopyWith<$Res> {
  factory $EmergencyWorkflowStepCopyWith(EmergencyWorkflowStep value,
          $Res Function(EmergencyWorkflowStep) then) =
      _$EmergencyWorkflowStepCopyWithImpl<$Res, EmergencyWorkflowStep>;
  @useResult
  $Res call({String title, String icon, String desc, bool active});
}

/// @nodoc
class _$EmergencyWorkflowStepCopyWithImpl<$Res,
        $Val extends EmergencyWorkflowStep>
    implements $EmergencyWorkflowStepCopyWith<$Res> {
  _$EmergencyWorkflowStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? desc = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyWorkflowStepImplCopyWith<$Res>
    implements $EmergencyWorkflowStepCopyWith<$Res> {
  factory _$$EmergencyWorkflowStepImplCopyWith(
          _$EmergencyWorkflowStepImpl value,
          $Res Function(_$EmergencyWorkflowStepImpl) then) =
      __$$EmergencyWorkflowStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String icon, String desc, bool active});
}

/// @nodoc
class __$$EmergencyWorkflowStepImplCopyWithImpl<$Res>
    extends _$EmergencyWorkflowStepCopyWithImpl<$Res,
        _$EmergencyWorkflowStepImpl>
    implements _$$EmergencyWorkflowStepImplCopyWith<$Res> {
  __$$EmergencyWorkflowStepImplCopyWithImpl(_$EmergencyWorkflowStepImpl _value,
      $Res Function(_$EmergencyWorkflowStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? desc = null,
    Object? active = null,
  }) {
    return _then(_$EmergencyWorkflowStepImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyWorkflowStepImpl implements _EmergencyWorkflowStep {
  const _$EmergencyWorkflowStepImpl(
      {required this.title,
      required this.icon,
      required this.desc,
      this.active = false});

  factory _$EmergencyWorkflowStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyWorkflowStepImplFromJson(json);

  @override
  final String title;
  @override
  final String icon;
  @override
  final String desc;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'EmergencyWorkflowStep(title: $title, icon: $icon, desc: $desc, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyWorkflowStepImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, icon, desc, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyWorkflowStepImplCopyWith<_$EmergencyWorkflowStepImpl>
      get copyWith => __$$EmergencyWorkflowStepImplCopyWithImpl<
          _$EmergencyWorkflowStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyWorkflowStepImplToJson(
      this,
    );
  }
}

abstract class _EmergencyWorkflowStep implements EmergencyWorkflowStep {
  const factory _EmergencyWorkflowStep(
      {required final String title,
      required final String icon,
      required final String desc,
      final bool active}) = _$EmergencyWorkflowStepImpl;

  factory _EmergencyWorkflowStep.fromJson(Map<String, dynamic> json) =
      _$EmergencyWorkflowStepImpl.fromJson;

  @override
  String get title;
  @override
  String get icon;
  @override
  String get desc;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyWorkflowStepImplCopyWith<_$EmergencyWorkflowStepImpl>
      get copyWith => throw _privateConstructorUsedError;
}
