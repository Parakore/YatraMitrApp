// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crowd_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CrowdStatus _$CrowdStatusFromJson(Map<String, dynamic> json) {
  return _CrowdStatus.fromJson(json);
}

/// @nodoc
mixin _$CrowdStatus {
  String get locationId => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  CrowdDensity get density => throw _privateConstructorUsedError;
  String get waitTime => throw _privateConstructorUsedError;
  String get suggestedTime => throw _privateConstructorUsedError;
  int get currentCount => throw _privateConstructorUsedError;
  int get maxCapacity => throw _privateConstructorUsedError;
  String get trafficLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrowdStatusCopyWith<CrowdStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrowdStatusCopyWith<$Res> {
  factory $CrowdStatusCopyWith(
          CrowdStatus value, $Res Function(CrowdStatus) then) =
      _$CrowdStatusCopyWithImpl<$Res, CrowdStatus>;
  @useResult
  $Res call(
      {String locationId,
      String locationName,
      CrowdDensity density,
      String waitTime,
      String suggestedTime,
      int currentCount,
      int maxCapacity,
      String trafficLevel});
}

/// @nodoc
class _$CrowdStatusCopyWithImpl<$Res, $Val extends CrowdStatus>
    implements $CrowdStatusCopyWith<$Res> {
  _$CrowdStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
    Object? locationName = null,
    Object? density = null,
    Object? waitTime = null,
    Object? suggestedTime = null,
    Object? currentCount = null,
    Object? maxCapacity = null,
    Object? trafficLevel = null,
  }) {
    return _then(_value.copyWith(
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as CrowdDensity,
      waitTime: null == waitTime
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedTime: null == suggestedTime
          ? _value.suggestedTime
          : suggestedTime // ignore: cast_nullable_to_non_nullable
              as String,
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      trafficLevel: null == trafficLevel
          ? _value.trafficLevel
          : trafficLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrowdStatusImplCopyWith<$Res>
    implements $CrowdStatusCopyWith<$Res> {
  factory _$$CrowdStatusImplCopyWith(
          _$CrowdStatusImpl value, $Res Function(_$CrowdStatusImpl) then) =
      __$$CrowdStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locationId,
      String locationName,
      CrowdDensity density,
      String waitTime,
      String suggestedTime,
      int currentCount,
      int maxCapacity,
      String trafficLevel});
}

/// @nodoc
class __$$CrowdStatusImplCopyWithImpl<$Res>
    extends _$CrowdStatusCopyWithImpl<$Res, _$CrowdStatusImpl>
    implements _$$CrowdStatusImplCopyWith<$Res> {
  __$$CrowdStatusImplCopyWithImpl(
      _$CrowdStatusImpl _value, $Res Function(_$CrowdStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
    Object? locationName = null,
    Object? density = null,
    Object? waitTime = null,
    Object? suggestedTime = null,
    Object? currentCount = null,
    Object? maxCapacity = null,
    Object? trafficLevel = null,
  }) {
    return _then(_$CrowdStatusImpl(
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as CrowdDensity,
      waitTime: null == waitTime
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedTime: null == suggestedTime
          ? _value.suggestedTime
          : suggestedTime // ignore: cast_nullable_to_non_nullable
              as String,
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      trafficLevel: null == trafficLevel
          ? _value.trafficLevel
          : trafficLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrowdStatusImpl implements _CrowdStatus {
  const _$CrowdStatusImpl(
      {required this.locationId,
      required this.locationName,
      required this.density,
      required this.waitTime,
      required this.suggestedTime,
      this.currentCount = 0,
      this.maxCapacity = 0,
      this.trafficLevel = 'Normal'});

  factory _$CrowdStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrowdStatusImplFromJson(json);

  @override
  final String locationId;
  @override
  final String locationName;
  @override
  final CrowdDensity density;
  @override
  final String waitTime;
  @override
  final String suggestedTime;
  @override
  @JsonKey()
  final int currentCount;
  @override
  @JsonKey()
  final int maxCapacity;
  @override
  @JsonKey()
  final String trafficLevel;

  @override
  String toString() {
    return 'CrowdStatus(locationId: $locationId, locationName: $locationName, density: $density, waitTime: $waitTime, suggestedTime: $suggestedTime, currentCount: $currentCount, maxCapacity: $maxCapacity, trafficLevel: $trafficLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrowdStatusImpl &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.density, density) || other.density == density) &&
            (identical(other.waitTime, waitTime) ||
                other.waitTime == waitTime) &&
            (identical(other.suggestedTime, suggestedTime) ||
                other.suggestedTime == suggestedTime) &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            (identical(other.trafficLevel, trafficLevel) ||
                other.trafficLevel == trafficLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      locationId,
      locationName,
      density,
      waitTime,
      suggestedTime,
      currentCount,
      maxCapacity,
      trafficLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrowdStatusImplCopyWith<_$CrowdStatusImpl> get copyWith =>
      __$$CrowdStatusImplCopyWithImpl<_$CrowdStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrowdStatusImplToJson(
      this,
    );
  }
}

abstract class _CrowdStatus implements CrowdStatus {
  const factory _CrowdStatus(
      {required final String locationId,
      required final String locationName,
      required final CrowdDensity density,
      required final String waitTime,
      required final String suggestedTime,
      final int currentCount,
      final int maxCapacity,
      final String trafficLevel}) = _$CrowdStatusImpl;

  factory _CrowdStatus.fromJson(Map<String, dynamic> json) =
      _$CrowdStatusImpl.fromJson;

  @override
  String get locationId;
  @override
  String get locationName;
  @override
  CrowdDensity get density;
  @override
  String get waitTime;
  @override
  String get suggestedTime;
  @override
  int get currentCount;
  @override
  int get maxCapacity;
  @override
  String get trafficLevel;
  @override
  @JsonKey(ignore: true)
  _$$CrowdStatusImplCopyWith<_$CrowdStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
