// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disaster_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DisasterAlert _$DisasterAlertFromJson(Map<String, dynamic> json) {
  return _DisasterAlert.fromJson(json);
}

/// @nodoc
mixin _$DisasterAlert {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AlertSeverity get severity => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisasterAlertCopyWith<DisasterAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisasterAlertCopyWith<$Res> {
  factory $DisasterAlertCopyWith(
          DisasterAlert value, $Res Function(DisasterAlert) then) =
      _$DisasterAlertCopyWithImpl<$Res, DisasterAlert>;
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      AlertSeverity severity,
      String type,
      DateTime timestamp,
      String location,
      bool isLive});
}

/// @nodoc
class _$DisasterAlertCopyWithImpl<$Res, $Val extends DisasterAlert>
    implements $DisasterAlertCopyWith<$Res> {
  _$DisasterAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? severity = null,
    Object? type = null,
    Object? timestamp = null,
    Object? location = null,
    Object? isLive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisasterAlertImplCopyWith<$Res>
    implements $DisasterAlertCopyWith<$Res> {
  factory _$$DisasterAlertImplCopyWith(
          _$DisasterAlertImpl value, $Res Function(_$DisasterAlertImpl) then) =
      __$$DisasterAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      AlertSeverity severity,
      String type,
      DateTime timestamp,
      String location,
      bool isLive});
}

/// @nodoc
class __$$DisasterAlertImplCopyWithImpl<$Res>
    extends _$DisasterAlertCopyWithImpl<$Res, _$DisasterAlertImpl>
    implements _$$DisasterAlertImplCopyWith<$Res> {
  __$$DisasterAlertImplCopyWithImpl(
      _$DisasterAlertImpl _value, $Res Function(_$DisasterAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? severity = null,
    Object? type = null,
    Object? timestamp = null,
    Object? location = null,
    Object? isLive = null,
  }) {
    return _then(_$DisasterAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisasterAlertImpl implements _DisasterAlert {
  const _$DisasterAlertImpl(
      {required this.id,
      required this.title,
      required this.message,
      required this.severity,
      required this.type,
      required this.timestamp,
      this.location = 'Route 1',
      this.isLive = true});

  factory _$DisasterAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisasterAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String message;
  @override
  final AlertSeverity severity;
  @override
  final String type;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final bool isLive;

  @override
  String toString() {
    return 'DisasterAlert(id: $id, title: $title, message: $message, severity: $severity, type: $type, timestamp: $timestamp, location: $location, isLive: $isLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisasterAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, message, severity,
      type, timestamp, location, isLive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisasterAlertImplCopyWith<_$DisasterAlertImpl> get copyWith =>
      __$$DisasterAlertImplCopyWithImpl<_$DisasterAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisasterAlertImplToJson(
      this,
    );
  }
}

abstract class _DisasterAlert implements DisasterAlert {
  const factory _DisasterAlert(
      {required final String id,
      required final String title,
      required final String message,
      required final AlertSeverity severity,
      required final String type,
      required final DateTime timestamp,
      final String location,
      final bool isLive}) = _$DisasterAlertImpl;

  factory _DisasterAlert.fromJson(Map<String, dynamic> json) =
      _$DisasterAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get message;
  @override
  AlertSeverity get severity;
  @override
  String get type;
  @override
  DateTime get timestamp;
  @override
  String get location;
  @override
  bool get isLive;
  @override
  @JsonKey(ignore: true)
  _$$DisasterAlertImplCopyWith<_$DisasterAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
