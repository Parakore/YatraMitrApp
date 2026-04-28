// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yatra_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YatraPlan _$YatraPlanFromJson(Map<String, dynamic> json) {
  return _YatraPlan.fromJson(json);
}

/// @nodoc
mixin _$YatraPlan {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get dhamName => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get startDate => throw _privateConstructorUsedError;
  @HiveField(3)
  int get durationDays => throw _privateConstructorUsedError;
  @HiveField(4)
  String get startFrom => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String> get dhamsToCover => throw _privateConstructorUsedError;
  @HiveField(6)
  String get ageGroup => throw _privateConstructorUsedError;
  @HiveField(7)
  String get fitnessLevel => throw _privateConstructorUsedError;
  @HiveField(8)
  String get accommodationType => throw _privateConstructorUsedError;
  @HiveField(9)
  String get budgetRange => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get specialNeeds => throw _privateConstructorUsedError;
  @HiveField(11)
  List<YatraDayPlan>? get itinerary => throw _privateConstructorUsedError;
  @HiveField(12)
  String get status => throw _privateConstructorUsedError;
  @HiveField(13)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YatraPlanCopyWith<YatraPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YatraPlanCopyWith<$Res> {
  factory $YatraPlanCopyWith(YatraPlan value, $Res Function(YatraPlan) then) =
      _$YatraPlanCopyWithImpl<$Res, YatraPlan>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String dhamName,
      @HiveField(2) DateTime startDate,
      @HiveField(3) int durationDays,
      @HiveField(4) String startFrom,
      @HiveField(5) List<String> dhamsToCover,
      @HiveField(6) String ageGroup,
      @HiveField(7) String fitnessLevel,
      @HiveField(8) String accommodationType,
      @HiveField(9) String budgetRange,
      @HiveField(10) String? specialNeeds,
      @HiveField(11) List<YatraDayPlan>? itinerary,
      @HiveField(12) String status,
      @HiveField(13) DateTime? createdAt});
}

/// @nodoc
class _$YatraPlanCopyWithImpl<$Res, $Val extends YatraPlan>
    implements $YatraPlanCopyWith<$Res> {
  _$YatraPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dhamName = null,
    Object? startDate = null,
    Object? durationDays = null,
    Object? startFrom = null,
    Object? dhamsToCover = null,
    Object? ageGroup = null,
    Object? fitnessLevel = null,
    Object? accommodationType = null,
    Object? budgetRange = null,
    Object? specialNeeds = freezed,
    Object? itinerary = freezed,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dhamName: null == dhamName
          ? _value.dhamName
          : dhamName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      startFrom: null == startFrom
          ? _value.startFrom
          : startFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dhamsToCover: null == dhamsToCover
          ? _value.dhamsToCover
          : dhamsToCover // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      fitnessLevel: null == fitnessLevel
          ? _value.fitnessLevel
          : fitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      accommodationType: null == accommodationType
          ? _value.accommodationType
          : accommodationType // ignore: cast_nullable_to_non_nullable
              as String,
      budgetRange: null == budgetRange
          ? _value.budgetRange
          : budgetRange // ignore: cast_nullable_to_non_nullable
              as String,
      specialNeeds: freezed == specialNeeds
          ? _value.specialNeeds
          : specialNeeds // ignore: cast_nullable_to_non_nullable
              as String?,
      itinerary: freezed == itinerary
          ? _value.itinerary
          : itinerary // ignore: cast_nullable_to_non_nullable
              as List<YatraDayPlan>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YatraPlanImplCopyWith<$Res>
    implements $YatraPlanCopyWith<$Res> {
  factory _$$YatraPlanImplCopyWith(
          _$YatraPlanImpl value, $Res Function(_$YatraPlanImpl) then) =
      __$$YatraPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String dhamName,
      @HiveField(2) DateTime startDate,
      @HiveField(3) int durationDays,
      @HiveField(4) String startFrom,
      @HiveField(5) List<String> dhamsToCover,
      @HiveField(6) String ageGroup,
      @HiveField(7) String fitnessLevel,
      @HiveField(8) String accommodationType,
      @HiveField(9) String budgetRange,
      @HiveField(10) String? specialNeeds,
      @HiveField(11) List<YatraDayPlan>? itinerary,
      @HiveField(12) String status,
      @HiveField(13) DateTime? createdAt});
}

/// @nodoc
class __$$YatraPlanImplCopyWithImpl<$Res>
    extends _$YatraPlanCopyWithImpl<$Res, _$YatraPlanImpl>
    implements _$$YatraPlanImplCopyWith<$Res> {
  __$$YatraPlanImplCopyWithImpl(
      _$YatraPlanImpl _value, $Res Function(_$YatraPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dhamName = null,
    Object? startDate = null,
    Object? durationDays = null,
    Object? startFrom = null,
    Object? dhamsToCover = null,
    Object? ageGroup = null,
    Object? fitnessLevel = null,
    Object? accommodationType = null,
    Object? budgetRange = null,
    Object? specialNeeds = freezed,
    Object? itinerary = freezed,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$YatraPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dhamName: null == dhamName
          ? _value.dhamName
          : dhamName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      startFrom: null == startFrom
          ? _value.startFrom
          : startFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dhamsToCover: null == dhamsToCover
          ? _value._dhamsToCover
          : dhamsToCover // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      fitnessLevel: null == fitnessLevel
          ? _value.fitnessLevel
          : fitnessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      accommodationType: null == accommodationType
          ? _value.accommodationType
          : accommodationType // ignore: cast_nullable_to_non_nullable
              as String,
      budgetRange: null == budgetRange
          ? _value.budgetRange
          : budgetRange // ignore: cast_nullable_to_non_nullable
              as String,
      specialNeeds: freezed == specialNeeds
          ? _value.specialNeeds
          : specialNeeds // ignore: cast_nullable_to_non_nullable
              as String?,
      itinerary: freezed == itinerary
          ? _value._itinerary
          : itinerary // ignore: cast_nullable_to_non_nullable
              as List<YatraDayPlan>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'YatraPlanAdapter')
class _$YatraPlanImpl implements _YatraPlan {
  const _$YatraPlanImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.dhamName,
      @HiveField(2) required this.startDate,
      @HiveField(3) required this.durationDays,
      @HiveField(4) required this.startFrom,
      @HiveField(5) required final List<String> dhamsToCover,
      @HiveField(6) required this.ageGroup,
      @HiveField(7) required this.fitnessLevel,
      @HiveField(8) required this.accommodationType,
      @HiveField(9) required this.budgetRange,
      @HiveField(10) this.specialNeeds,
      @HiveField(11) final List<YatraDayPlan>? itinerary,
      @HiveField(12) this.status = 'Planned',
      @HiveField(13) this.createdAt})
      : _dhamsToCover = dhamsToCover,
        _itinerary = itinerary;

  factory _$YatraPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$YatraPlanImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String dhamName;
  @override
  @HiveField(2)
  final DateTime startDate;
  @override
  @HiveField(3)
  final int durationDays;
  @override
  @HiveField(4)
  final String startFrom;
  final List<String> _dhamsToCover;
  @override
  @HiveField(5)
  List<String> get dhamsToCover {
    if (_dhamsToCover is EqualUnmodifiableListView) return _dhamsToCover;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dhamsToCover);
  }

  @override
  @HiveField(6)
  final String ageGroup;
  @override
  @HiveField(7)
  final String fitnessLevel;
  @override
  @HiveField(8)
  final String accommodationType;
  @override
  @HiveField(9)
  final String budgetRange;
  @override
  @HiveField(10)
  final String? specialNeeds;
  final List<YatraDayPlan>? _itinerary;
  @override
  @HiveField(11)
  List<YatraDayPlan>? get itinerary {
    final value = _itinerary;
    if (value == null) return null;
    if (_itinerary is EqualUnmodifiableListView) return _itinerary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  @HiveField(12)
  final String status;
  @override
  @HiveField(13)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'YatraPlan(id: $id, dhamName: $dhamName, startDate: $startDate, durationDays: $durationDays, startFrom: $startFrom, dhamsToCover: $dhamsToCover, ageGroup: $ageGroup, fitnessLevel: $fitnessLevel, accommodationType: $accommodationType, budgetRange: $budgetRange, specialNeeds: $specialNeeds, itinerary: $itinerary, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YatraPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dhamName, dhamName) ||
                other.dhamName == dhamName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            (identical(other.startFrom, startFrom) ||
                other.startFrom == startFrom) &&
            const DeepCollectionEquality()
                .equals(other._dhamsToCover, _dhamsToCover) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.fitnessLevel, fitnessLevel) ||
                other.fitnessLevel == fitnessLevel) &&
            (identical(other.accommodationType, accommodationType) ||
                other.accommodationType == accommodationType) &&
            (identical(other.budgetRange, budgetRange) ||
                other.budgetRange == budgetRange) &&
            (identical(other.specialNeeds, specialNeeds) ||
                other.specialNeeds == specialNeeds) &&
            const DeepCollectionEquality()
                .equals(other._itinerary, _itinerary) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dhamName,
      startDate,
      durationDays,
      startFrom,
      const DeepCollectionEquality().hash(_dhamsToCover),
      ageGroup,
      fitnessLevel,
      accommodationType,
      budgetRange,
      specialNeeds,
      const DeepCollectionEquality().hash(_itinerary),
      status,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YatraPlanImplCopyWith<_$YatraPlanImpl> get copyWith =>
      __$$YatraPlanImplCopyWithImpl<_$YatraPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YatraPlanImplToJson(
      this,
    );
  }
}

abstract class _YatraPlan implements YatraPlan {
  const factory _YatraPlan(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String dhamName,
      @HiveField(2) required final DateTime startDate,
      @HiveField(3) required final int durationDays,
      @HiveField(4) required final String startFrom,
      @HiveField(5) required final List<String> dhamsToCover,
      @HiveField(6) required final String ageGroup,
      @HiveField(7) required final String fitnessLevel,
      @HiveField(8) required final String accommodationType,
      @HiveField(9) required final String budgetRange,
      @HiveField(10) final String? specialNeeds,
      @HiveField(11) final List<YatraDayPlan>? itinerary,
      @HiveField(12) final String status,
      @HiveField(13) final DateTime? createdAt}) = _$YatraPlanImpl;

  factory _YatraPlan.fromJson(Map<String, dynamic> json) =
      _$YatraPlanImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get dhamName;
  @override
  @HiveField(2)
  DateTime get startDate;
  @override
  @HiveField(3)
  int get durationDays;
  @override
  @HiveField(4)
  String get startFrom;
  @override
  @HiveField(5)
  List<String> get dhamsToCover;
  @override
  @HiveField(6)
  String get ageGroup;
  @override
  @HiveField(7)
  String get fitnessLevel;
  @override
  @HiveField(8)
  String get accommodationType;
  @override
  @HiveField(9)
  String get budgetRange;
  @override
  @HiveField(10)
  String? get specialNeeds;
  @override
  @HiveField(11)
  List<YatraDayPlan>? get itinerary;
  @override
  @HiveField(12)
  String get status;
  @override
  @HiveField(13)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$YatraPlanImplCopyWith<_$YatraPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

YatraDayPlan _$YatraDayPlanFromJson(Map<String, dynamic> json) {
  return _YatraDayPlan.fromJson(json);
}

/// @nodoc
mixin _$YatraDayPlan {
  @HiveField(0)
  int get dayNumber => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(2)
  String get route => throw _privateConstructorUsedError;
  @HiveField(3)
  String get distance => throw _privateConstructorUsedError;
  @HiveField(4)
  String get transport => throw _privateConstructorUsedError;
  @HiveField(5)
  String get accommodation => throw _privateConstructorUsedError;
  @HiveField(6)
  String get weather => throw _privateConstructorUsedError;
  @HiveField(7)
  String get crowdForecast => throw _privateConstructorUsedError;
  @HiveField(8)
  String get aiTip => throw _privateConstructorUsedError;
  @HiveField(9)
  String get riskLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YatraDayPlanCopyWith<YatraDayPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YatraDayPlanCopyWith<$Res> {
  factory $YatraDayPlanCopyWith(
          YatraDayPlan value, $Res Function(YatraDayPlan) then) =
      _$YatraDayPlanCopyWithImpl<$Res, YatraDayPlan>;
  @useResult
  $Res call(
      {@HiveField(0) int dayNumber,
      @HiveField(1) DateTime date,
      @HiveField(2) String route,
      @HiveField(3) String distance,
      @HiveField(4) String transport,
      @HiveField(5) String accommodation,
      @HiveField(6) String weather,
      @HiveField(7) String crowdForecast,
      @HiveField(8) String aiTip,
      @HiveField(9) String riskLevel});
}

/// @nodoc
class _$YatraDayPlanCopyWithImpl<$Res, $Val extends YatraDayPlan>
    implements $YatraDayPlanCopyWith<$Res> {
  _$YatraDayPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayNumber = null,
    Object? date = null,
    Object? route = null,
    Object? distance = null,
    Object? transport = null,
    Object? accommodation = null,
    Object? weather = null,
    Object? crowdForecast = null,
    Object? aiTip = null,
    Object? riskLevel = null,
  }) {
    return _then(_value.copyWith(
      dayNumber: null == dayNumber
          ? _value.dayNumber
          : dayNumber // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      transport: null == transport
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as String,
      accommodation: null == accommodation
          ? _value.accommodation
          : accommodation // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String,
      crowdForecast: null == crowdForecast
          ? _value.crowdForecast
          : crowdForecast // ignore: cast_nullable_to_non_nullable
              as String,
      aiTip: null == aiTip
          ? _value.aiTip
          : aiTip // ignore: cast_nullable_to_non_nullable
              as String,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YatraDayPlanImplCopyWith<$Res>
    implements $YatraDayPlanCopyWith<$Res> {
  factory _$$YatraDayPlanImplCopyWith(
          _$YatraDayPlanImpl value, $Res Function(_$YatraDayPlanImpl) then) =
      __$$YatraDayPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int dayNumber,
      @HiveField(1) DateTime date,
      @HiveField(2) String route,
      @HiveField(3) String distance,
      @HiveField(4) String transport,
      @HiveField(5) String accommodation,
      @HiveField(6) String weather,
      @HiveField(7) String crowdForecast,
      @HiveField(8) String aiTip,
      @HiveField(9) String riskLevel});
}

/// @nodoc
class __$$YatraDayPlanImplCopyWithImpl<$Res>
    extends _$YatraDayPlanCopyWithImpl<$Res, _$YatraDayPlanImpl>
    implements _$$YatraDayPlanImplCopyWith<$Res> {
  __$$YatraDayPlanImplCopyWithImpl(
      _$YatraDayPlanImpl _value, $Res Function(_$YatraDayPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayNumber = null,
    Object? date = null,
    Object? route = null,
    Object? distance = null,
    Object? transport = null,
    Object? accommodation = null,
    Object? weather = null,
    Object? crowdForecast = null,
    Object? aiTip = null,
    Object? riskLevel = null,
  }) {
    return _then(_$YatraDayPlanImpl(
      dayNumber: null == dayNumber
          ? _value.dayNumber
          : dayNumber // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      transport: null == transport
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as String,
      accommodation: null == accommodation
          ? _value.accommodation
          : accommodation // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String,
      crowdForecast: null == crowdForecast
          ? _value.crowdForecast
          : crowdForecast // ignore: cast_nullable_to_non_nullable
              as String,
      aiTip: null == aiTip
          ? _value.aiTip
          : aiTip // ignore: cast_nullable_to_non_nullable
              as String,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'YatraDayPlanAdapter')
class _$YatraDayPlanImpl implements _YatraDayPlan {
  const _$YatraDayPlanImpl(
      {@HiveField(0) required this.dayNumber,
      @HiveField(1) required this.date,
      @HiveField(2) required this.route,
      @HiveField(3) required this.distance,
      @HiveField(4) required this.transport,
      @HiveField(5) required this.accommodation,
      @HiveField(6) required this.weather,
      @HiveField(7) required this.crowdForecast,
      @HiveField(8) required this.aiTip,
      @HiveField(9) this.riskLevel = 'Low'});

  factory _$YatraDayPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$YatraDayPlanImplFromJson(json);

  @override
  @HiveField(0)
  final int dayNumber;
  @override
  @HiveField(1)
  final DateTime date;
  @override
  @HiveField(2)
  final String route;
  @override
  @HiveField(3)
  final String distance;
  @override
  @HiveField(4)
  final String transport;
  @override
  @HiveField(5)
  final String accommodation;
  @override
  @HiveField(6)
  final String weather;
  @override
  @HiveField(7)
  final String crowdForecast;
  @override
  @HiveField(8)
  final String aiTip;
  @override
  @JsonKey()
  @HiveField(9)
  final String riskLevel;

  @override
  String toString() {
    return 'YatraDayPlan(dayNumber: $dayNumber, date: $date, route: $route, distance: $distance, transport: $transport, accommodation: $accommodation, weather: $weather, crowdForecast: $crowdForecast, aiTip: $aiTip, riskLevel: $riskLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YatraDayPlanImpl &&
            (identical(other.dayNumber, dayNumber) ||
                other.dayNumber == dayNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.transport, transport) ||
                other.transport == transport) &&
            (identical(other.accommodation, accommodation) ||
                other.accommodation == accommodation) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.crowdForecast, crowdForecast) ||
                other.crowdForecast == crowdForecast) &&
            (identical(other.aiTip, aiTip) || other.aiTip == aiTip) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayNumber, date, route, distance,
      transport, accommodation, weather, crowdForecast, aiTip, riskLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YatraDayPlanImplCopyWith<_$YatraDayPlanImpl> get copyWith =>
      __$$YatraDayPlanImplCopyWithImpl<_$YatraDayPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YatraDayPlanImplToJson(
      this,
    );
  }
}

abstract class _YatraDayPlan implements YatraDayPlan {
  const factory _YatraDayPlan(
      {@HiveField(0) required final int dayNumber,
      @HiveField(1) required final DateTime date,
      @HiveField(2) required final String route,
      @HiveField(3) required final String distance,
      @HiveField(4) required final String transport,
      @HiveField(5) required final String accommodation,
      @HiveField(6) required final String weather,
      @HiveField(7) required final String crowdForecast,
      @HiveField(8) required final String aiTip,
      @HiveField(9) final String riskLevel}) = _$YatraDayPlanImpl;

  factory _YatraDayPlan.fromJson(Map<String, dynamic> json) =
      _$YatraDayPlanImpl.fromJson;

  @override
  @HiveField(0)
  int get dayNumber;
  @override
  @HiveField(1)
  DateTime get date;
  @override
  @HiveField(2)
  String get route;
  @override
  @HiveField(3)
  String get distance;
  @override
  @HiveField(4)
  String get transport;
  @override
  @HiveField(5)
  String get accommodation;
  @override
  @HiveField(6)
  String get weather;
  @override
  @HiveField(7)
  String get crowdForecast;
  @override
  @HiveField(8)
  String get aiTip;
  @override
  @HiveField(9)
  String get riskLevel;
  @override
  @JsonKey(ignore: true)
  _$$YatraDayPlanImplCopyWith<_$YatraDayPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
