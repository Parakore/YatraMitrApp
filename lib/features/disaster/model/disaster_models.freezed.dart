// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disaster_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteStatus _$RouteStatusFromJson(Map<String, dynamic> json) {
  return _RouteStatus.fromJson(json);
}

/// @nodoc
mixin _$RouteStatus {
  String get name => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // OPEN, CAUTION, CLOSED
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteStatusCopyWith<RouteStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStatusCopyWith<$Res> {
  factory $RouteStatusCopyWith(
          RouteStatus value, $Res Function(RouteStatus) then) =
      _$RouteStatusCopyWithImpl<$Res, RouteStatus>;
  @useResult
  $Res call({String name, String status, DateTime lastUpdated});
}

/// @nodoc
class _$RouteStatusCopyWithImpl<$Res, $Val extends RouteStatus>
    implements $RouteStatusCopyWith<$Res> {
  _$RouteStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? status = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteStatusImplCopyWith<$Res>
    implements $RouteStatusCopyWith<$Res> {
  factory _$$RouteStatusImplCopyWith(
          _$RouteStatusImpl value, $Res Function(_$RouteStatusImpl) then) =
      __$$RouteStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String status, DateTime lastUpdated});
}

/// @nodoc
class __$$RouteStatusImplCopyWithImpl<$Res>
    extends _$RouteStatusCopyWithImpl<$Res, _$RouteStatusImpl>
    implements _$$RouteStatusImplCopyWith<$Res> {
  __$$RouteStatusImplCopyWithImpl(
      _$RouteStatusImpl _value, $Res Function(_$RouteStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? status = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$RouteStatusImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteStatusImpl implements _RouteStatus {
  const _$RouteStatusImpl(
      {required this.name, required this.status, required this.lastUpdated});

  factory _$RouteStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteStatusImplFromJson(json);

  @override
  final String name;
  @override
  final String status;
// OPEN, CAUTION, CLOSED
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'RouteStatus(name: $name, status: $status, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStatusImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, status, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStatusImplCopyWith<_$RouteStatusImpl> get copyWith =>
      __$$RouteStatusImplCopyWithImpl<_$RouteStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteStatusImplToJson(
      this,
    );
  }
}

abstract class _RouteStatus implements RouteStatus {
  const factory _RouteStatus(
      {required final String name,
      required final String status,
      required final DateTime lastUpdated}) = _$RouteStatusImpl;

  factory _RouteStatus.fromJson(Map<String, dynamic> json) =
      _$RouteStatusImpl.fromJson;

  @override
  String get name;
  @override
  String get status;
  @override // OPEN, CAUTION, CLOSED
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$RouteStatusImplCopyWith<_$RouteStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherSummary _$WeatherSummaryFromJson(Map<String, dynamic> json) {
  return _WeatherSummary.fromJson(json);
}

/// @nodoc
mixin _$WeatherSummary {
  double get temperature => throw _privateConstructorUsedError;
  double get rainfall => throw _privateConstructorUsedError;
  String get visibility =>
      throw _privateConstructorUsedError; // Good, Moderate, Poor
  String get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherSummaryCopyWith<WeatherSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherSummaryCopyWith<$Res> {
  factory $WeatherSummaryCopyWith(
          WeatherSummary value, $Res Function(WeatherSummary) then) =
      _$WeatherSummaryCopyWithImpl<$Res, WeatherSummary>;
  @useResult
  $Res call(
      {double temperature,
      double rainfall,
      String visibility,
      String condition});
}

/// @nodoc
class _$WeatherSummaryCopyWithImpl<$Res, $Val extends WeatherSummary>
    implements $WeatherSummaryCopyWith<$Res> {
  _$WeatherSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? rainfall = null,
    Object? visibility = null,
    Object? condition = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherSummaryImplCopyWith<$Res>
    implements $WeatherSummaryCopyWith<$Res> {
  factory _$$WeatherSummaryImplCopyWith(_$WeatherSummaryImpl value,
          $Res Function(_$WeatherSummaryImpl) then) =
      __$$WeatherSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double rainfall,
      String visibility,
      String condition});
}

/// @nodoc
class __$$WeatherSummaryImplCopyWithImpl<$Res>
    extends _$WeatherSummaryCopyWithImpl<$Res, _$WeatherSummaryImpl>
    implements _$$WeatherSummaryImplCopyWith<$Res> {
  __$$WeatherSummaryImplCopyWithImpl(
      _$WeatherSummaryImpl _value, $Res Function(_$WeatherSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? rainfall = null,
    Object? visibility = null,
    Object? condition = null,
  }) {
    return _then(_$WeatherSummaryImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherSummaryImpl implements _WeatherSummary {
  const _$WeatherSummaryImpl(
      {required this.temperature,
      required this.rainfall,
      required this.visibility,
      required this.condition});

  factory _$WeatherSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherSummaryImplFromJson(json);

  @override
  final double temperature;
  @override
  final double rainfall;
  @override
  final String visibility;
// Good, Moderate, Poor
  @override
  final String condition;

  @override
  String toString() {
    return 'WeatherSummary(temperature: $temperature, rainfall: $rainfall, visibility: $visibility, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherSummaryImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.rainfall, rainfall) ||
                other.rainfall == rainfall) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temperature, rainfall, visibility, condition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherSummaryImplCopyWith<_$WeatherSummaryImpl> get copyWith =>
      __$$WeatherSummaryImplCopyWithImpl<_$WeatherSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherSummaryImplToJson(
      this,
    );
  }
}

abstract class _WeatherSummary implements WeatherSummary {
  const factory _WeatherSummary(
      {required final double temperature,
      required final double rainfall,
      required final String visibility,
      required final String condition}) = _$WeatherSummaryImpl;

  factory _WeatherSummary.fromJson(Map<String, dynamic> json) =
      _$WeatherSummaryImpl.fromJson;

  @override
  double get temperature;
  @override
  double get rainfall;
  @override
  String get visibility;
  @override // Good, Moderate, Poor
  String get condition;
  @override
  @JsonKey(ignore: true)
  _$$WeatherSummaryImplCopyWith<_$WeatherSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlertModel _$AlertModelFromJson(Map<String, dynamic> json) {
  return _AlertModel.fromJson(json);
}

/// @nodoc
mixin _$AlertModel {
  String get type =>
      throw _privateConstructorUsedError; // Landslide, Rain, Closure, Flood
  String get location => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // Low, Medium, High
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlertModelCopyWith<AlertModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertModelCopyWith<$Res> {
  factory $AlertModelCopyWith(
          AlertModel value, $Res Function(AlertModel) then) =
      _$AlertModelCopyWithImpl<$Res, AlertModel>;
  @useResult
  $Res call(
      {String type,
      String location,
      String severity,
      DateTime timestamp,
      String action,
      double? distance});
}

/// @nodoc
class _$AlertModelCopyWithImpl<$Res, $Val extends AlertModel>
    implements $AlertModelCopyWith<$Res> {
  _$AlertModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? location = null,
    Object? severity = null,
    Object? timestamp = null,
    Object? action = null,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertModelImplCopyWith<$Res>
    implements $AlertModelCopyWith<$Res> {
  factory _$$AlertModelImplCopyWith(
          _$AlertModelImpl value, $Res Function(_$AlertModelImpl) then) =
      __$$AlertModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String location,
      String severity,
      DateTime timestamp,
      String action,
      double? distance});
}

/// @nodoc
class __$$AlertModelImplCopyWithImpl<$Res>
    extends _$AlertModelCopyWithImpl<$Res, _$AlertModelImpl>
    implements _$$AlertModelImplCopyWith<$Res> {
  __$$AlertModelImplCopyWithImpl(
      _$AlertModelImpl _value, $Res Function(_$AlertModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? location = null,
    Object? severity = null,
    Object? timestamp = null,
    Object? action = null,
    Object? distance = freezed,
  }) {
    return _then(_$AlertModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertModelImpl implements _AlertModel {
  const _$AlertModelImpl(
      {required this.type,
      required this.location,
      required this.severity,
      required this.timestamp,
      required this.action,
      this.distance});

  factory _$AlertModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertModelImplFromJson(json);

  @override
  final String type;
// Landslide, Rain, Closure, Flood
  @override
  final String location;
  @override
  final String severity;
// Low, Medium, High
  @override
  final DateTime timestamp;
  @override
  final String action;
  @override
  final double? distance;

  @override
  String toString() {
    return 'AlertModel(type: $type, location: $location, severity: $severity, timestamp: $timestamp, action: $action, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, location, severity, timestamp, action, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertModelImplCopyWith<_$AlertModelImpl> get copyWith =>
      __$$AlertModelImplCopyWithImpl<_$AlertModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertModelImplToJson(
      this,
    );
  }
}

abstract class _AlertModel implements AlertModel {
  const factory _AlertModel(
      {required final String type,
      required final String location,
      required final String severity,
      required final DateTime timestamp,
      required final String action,
      final double? distance}) = _$AlertModelImpl;

  factory _AlertModel.fromJson(Map<String, dynamic> json) =
      _$AlertModelImpl.fromJson;

  @override
  String get type;
  @override // Landslide, Rain, Closure, Flood
  String get location;
  @override
  String get severity;
  @override // Low, Medium, High
  DateTime get timestamp;
  @override
  String get action;
  @override
  double? get distance;
  @override
  @JsonKey(ignore: true)
  _$$AlertModelImplCopyWith<_$AlertModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return _ForecastModel.fromJson(json);
}

/// @nodoc
mixin _$ForecastModel {
  DateTime get date => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  double get rainfall => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  String get trekStatus =>
      throw _privateConstructorUsedError; // Proceed, Caution, Avoid
  String? get riskExplanation => throw _privateConstructorUsedError;
  String? get bestTravelWindow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastModelCopyWith<ForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastModelCopyWith<$Res> {
  factory $ForecastModelCopyWith(
          ForecastModel value, $Res Function(ForecastModel) then) =
      _$ForecastModelCopyWithImpl<$Res, ForecastModel>;
  @useResult
  $Res call(
      {DateTime date,
      String condition,
      double temperature,
      double rainfall,
      String visibility,
      String trekStatus,
      String? riskExplanation,
      String? bestTravelWindow});
}

/// @nodoc
class _$ForecastModelCopyWithImpl<$Res, $Val extends ForecastModel>
    implements $ForecastModelCopyWith<$Res> {
  _$ForecastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? condition = null,
    Object? temperature = null,
    Object? rainfall = null,
    Object? visibility = null,
    Object? trekStatus = null,
    Object? riskExplanation = freezed,
    Object? bestTravelWindow = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      trekStatus: null == trekStatus
          ? _value.trekStatus
          : trekStatus // ignore: cast_nullable_to_non_nullable
              as String,
      riskExplanation: freezed == riskExplanation
          ? _value.riskExplanation
          : riskExplanation // ignore: cast_nullable_to_non_nullable
              as String?,
      bestTravelWindow: freezed == bestTravelWindow
          ? _value.bestTravelWindow
          : bestTravelWindow // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastModelImplCopyWith<$Res>
    implements $ForecastModelCopyWith<$Res> {
  factory _$$ForecastModelImplCopyWith(
          _$ForecastModelImpl value, $Res Function(_$ForecastModelImpl) then) =
      __$$ForecastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String condition,
      double temperature,
      double rainfall,
      String visibility,
      String trekStatus,
      String? riskExplanation,
      String? bestTravelWindow});
}

/// @nodoc
class __$$ForecastModelImplCopyWithImpl<$Res>
    extends _$ForecastModelCopyWithImpl<$Res, _$ForecastModelImpl>
    implements _$$ForecastModelImplCopyWith<$Res> {
  __$$ForecastModelImplCopyWithImpl(
      _$ForecastModelImpl _value, $Res Function(_$ForecastModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? condition = null,
    Object? temperature = null,
    Object? rainfall = null,
    Object? visibility = null,
    Object? trekStatus = null,
    Object? riskExplanation = freezed,
    Object? bestTravelWindow = freezed,
  }) {
    return _then(_$ForecastModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      trekStatus: null == trekStatus
          ? _value.trekStatus
          : trekStatus // ignore: cast_nullable_to_non_nullable
              as String,
      riskExplanation: freezed == riskExplanation
          ? _value.riskExplanation
          : riskExplanation // ignore: cast_nullable_to_non_nullable
              as String?,
      bestTravelWindow: freezed == bestTravelWindow
          ? _value.bestTravelWindow
          : bestTravelWindow // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastModelImpl implements _ForecastModel {
  const _$ForecastModelImpl(
      {required this.date,
      required this.condition,
      required this.temperature,
      required this.rainfall,
      required this.visibility,
      required this.trekStatus,
      this.riskExplanation,
      this.bestTravelWindow});

  factory _$ForecastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastModelImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String condition;
  @override
  final double temperature;
  @override
  final double rainfall;
  @override
  final String visibility;
  @override
  final String trekStatus;
// Proceed, Caution, Avoid
  @override
  final String? riskExplanation;
  @override
  final String? bestTravelWindow;

  @override
  String toString() {
    return 'ForecastModel(date: $date, condition: $condition, temperature: $temperature, rainfall: $rainfall, visibility: $visibility, trekStatus: $trekStatus, riskExplanation: $riskExplanation, bestTravelWindow: $bestTravelWindow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.rainfall, rainfall) ||
                other.rainfall == rainfall) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.trekStatus, trekStatus) ||
                other.trekStatus == trekStatus) &&
            (identical(other.riskExplanation, riskExplanation) ||
                other.riskExplanation == riskExplanation) &&
            (identical(other.bestTravelWindow, bestTravelWindow) ||
                other.bestTravelWindow == bestTravelWindow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, condition, temperature,
      rainfall, visibility, trekStatus, riskExplanation, bestTravelWindow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastModelImplCopyWith<_$ForecastModelImpl> get copyWith =>
      __$$ForecastModelImplCopyWithImpl<_$ForecastModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastModelImplToJson(
      this,
    );
  }
}

abstract class _ForecastModel implements ForecastModel {
  const factory _ForecastModel(
      {required final DateTime date,
      required final String condition,
      required final double temperature,
      required final double rainfall,
      required final String visibility,
      required final String trekStatus,
      final String? riskExplanation,
      final String? bestTravelWindow}) = _$ForecastModelImpl;

  factory _ForecastModel.fromJson(Map<String, dynamic> json) =
      _$ForecastModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get condition;
  @override
  double get temperature;
  @override
  double get rainfall;
  @override
  String get visibility;
  @override
  String get trekStatus;
  @override // Proceed, Caution, Avoid
  String? get riskExplanation;
  @override
  String? get bestTravelWindow;
  @override
  @JsonKey(ignore: true)
  _$$ForecastModelImplCopyWith<_$ForecastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LandslideZone _$LandslideZoneFromJson(Map<String, dynamic> json) {
  return _LandslideZone.fromJson(json);
}

/// @nodoc
mixin _$LandslideZone {
  String get id => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get riskLevel =>
      throw _privateConstructorUsedError; // Low, Medium, High
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LandslideZoneCopyWith<LandslideZone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandslideZoneCopyWith<$Res> {
  factory $LandslideZoneCopyWith(
          LandslideZone value, $Res Function(LandslideZone) then) =
      _$LandslideZoneCopyWithImpl<$Res, LandslideZone>;
  @useResult
  $Res call({String id, String location, String riskLevel, String status});
}

/// @nodoc
class _$LandslideZoneCopyWithImpl<$Res, $Val extends LandslideZone>
    implements $LandslideZoneCopyWith<$Res> {
  _$LandslideZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? riskLevel = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LandslideZoneImplCopyWith<$Res>
    implements $LandslideZoneCopyWith<$Res> {
  factory _$$LandslideZoneImplCopyWith(
          _$LandslideZoneImpl value, $Res Function(_$LandslideZoneImpl) then) =
      __$$LandslideZoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String location, String riskLevel, String status});
}

/// @nodoc
class __$$LandslideZoneImplCopyWithImpl<$Res>
    extends _$LandslideZoneCopyWithImpl<$Res, _$LandslideZoneImpl>
    implements _$$LandslideZoneImplCopyWith<$Res> {
  __$$LandslideZoneImplCopyWithImpl(
      _$LandslideZoneImpl _value, $Res Function(_$LandslideZoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? riskLevel = null,
    Object? status = null,
  }) {
    return _then(_$LandslideZoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
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
class _$LandslideZoneImpl implements _LandslideZone {
  const _$LandslideZoneImpl(
      {required this.id,
      required this.location,
      required this.riskLevel,
      required this.status});

  factory _$LandslideZoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$LandslideZoneImplFromJson(json);

  @override
  final String id;
  @override
  final String location;
  @override
  final String riskLevel;
// Low, Medium, High
  @override
  final String status;

  @override
  String toString() {
    return 'LandslideZone(id: $id, location: $location, riskLevel: $riskLevel, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LandslideZoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, location, riskLevel, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LandslideZoneImplCopyWith<_$LandslideZoneImpl> get copyWith =>
      __$$LandslideZoneImplCopyWithImpl<_$LandslideZoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LandslideZoneImplToJson(
      this,
    );
  }
}

abstract class _LandslideZone implements LandslideZone {
  const factory _LandslideZone(
      {required final String id,
      required final String location,
      required final String riskLevel,
      required final String status}) = _$LandslideZoneImpl;

  factory _LandslideZone.fromJson(Map<String, dynamic> json) =
      _$LandslideZoneImpl.fromJson;

  @override
  String get id;
  @override
  String get location;
  @override
  String get riskLevel;
  @override // Low, Medium, High
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$LandslideZoneImplCopyWith<_$LandslideZoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteClosure _$RouteClosureFromJson(Map<String, dynamic> json) {
  return _RouteClosure.fromJson(json);
}

/// @nodoc
mixin _$RouteClosure {
  String get routeName => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // Open, Partial, Closed
  String get reason => throw _privateConstructorUsedError;
  String? get estimatedReopenTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteClosureCopyWith<RouteClosure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteClosureCopyWith<$Res> {
  factory $RouteClosureCopyWith(
          RouteClosure value, $Res Function(RouteClosure) then) =
      _$RouteClosureCopyWithImpl<$Res, RouteClosure>;
  @useResult
  $Res call(
      {String routeName,
      String status,
      String reason,
      String? estimatedReopenTime});
}

/// @nodoc
class _$RouteClosureCopyWithImpl<$Res, $Val extends RouteClosure>
    implements $RouteClosureCopyWith<$Res> {
  _$RouteClosureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeName = null,
    Object? status = null,
    Object? reason = null,
    Object? estimatedReopenTime = freezed,
  }) {
    return _then(_value.copyWith(
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedReopenTime: freezed == estimatedReopenTime
          ? _value.estimatedReopenTime
          : estimatedReopenTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteClosureImplCopyWith<$Res>
    implements $RouteClosureCopyWith<$Res> {
  factory _$$RouteClosureImplCopyWith(
          _$RouteClosureImpl value, $Res Function(_$RouteClosureImpl) then) =
      __$$RouteClosureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String routeName,
      String status,
      String reason,
      String? estimatedReopenTime});
}

/// @nodoc
class __$$RouteClosureImplCopyWithImpl<$Res>
    extends _$RouteClosureCopyWithImpl<$Res, _$RouteClosureImpl>
    implements _$$RouteClosureImplCopyWith<$Res> {
  __$$RouteClosureImplCopyWithImpl(
      _$RouteClosureImpl _value, $Res Function(_$RouteClosureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeName = null,
    Object? status = null,
    Object? reason = null,
    Object? estimatedReopenTime = freezed,
  }) {
    return _then(_$RouteClosureImpl(
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedReopenTime: freezed == estimatedReopenTime
          ? _value.estimatedReopenTime
          : estimatedReopenTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteClosureImpl implements _RouteClosure {
  const _$RouteClosureImpl(
      {required this.routeName,
      required this.status,
      required this.reason,
      this.estimatedReopenTime});

  factory _$RouteClosureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteClosureImplFromJson(json);

  @override
  final String routeName;
  @override
  final String status;
// Open, Partial, Closed
  @override
  final String reason;
  @override
  final String? estimatedReopenTime;

  @override
  String toString() {
    return 'RouteClosure(routeName: $routeName, status: $status, reason: $reason, estimatedReopenTime: $estimatedReopenTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteClosureImpl &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.estimatedReopenTime, estimatedReopenTime) ||
                other.estimatedReopenTime == estimatedReopenTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, routeName, status, reason, estimatedReopenTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteClosureImplCopyWith<_$RouteClosureImpl> get copyWith =>
      __$$RouteClosureImplCopyWithImpl<_$RouteClosureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteClosureImplToJson(
      this,
    );
  }
}

abstract class _RouteClosure implements RouteClosure {
  const factory _RouteClosure(
      {required final String routeName,
      required final String status,
      required final String reason,
      final String? estimatedReopenTime}) = _$RouteClosureImpl;

  factory _RouteClosure.fromJson(Map<String, dynamic> json) =
      _$RouteClosureImpl.fromJson;

  @override
  String get routeName;
  @override
  String get status;
  @override // Open, Partial, Closed
  String get reason;
  @override
  String? get estimatedReopenTime;
  @override
  @JsonKey(ignore: true)
  _$$RouteClosureImplCopyWith<_$RouteClosureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DisasterIntelligenceSummary _$DisasterIntelligenceSummaryFromJson(
    Map<String, dynamic> json) {
  return _DisasterIntelligenceSummary.fromJson(json);
}

/// @nodoc
mixin _$DisasterIntelligenceSummary {
  List<RouteStatus> get routeStatuses => throw _privateConstructorUsedError;
  WeatherSummary get weatherSummary => throw _privateConstructorUsedError;
  List<AlertModel> get activeAlerts => throw _privateConstructorUsedError;
  List<ForecastModel> get fiveDayForecast => throw _privateConstructorUsedError;
  List<LandslideZone> get landslideZones => throw _privateConstructorUsedError;
  List<RouteClosure> get routeClosures => throw _privateConstructorUsedError;
  List<String> get aiRecommendations => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisasterIntelligenceSummaryCopyWith<DisasterIntelligenceSummary>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisasterIntelligenceSummaryCopyWith<$Res> {
  factory $DisasterIntelligenceSummaryCopyWith(
          DisasterIntelligenceSummary value,
          $Res Function(DisasterIntelligenceSummary) then) =
      _$DisasterIntelligenceSummaryCopyWithImpl<$Res,
          DisasterIntelligenceSummary>;
  @useResult
  $Res call(
      {List<RouteStatus> routeStatuses,
      WeatherSummary weatherSummary,
      List<AlertModel> activeAlerts,
      List<ForecastModel> fiveDayForecast,
      List<LandslideZone> landslideZones,
      List<RouteClosure> routeClosures,
      List<String> aiRecommendations,
      DateTime lastUpdated});

  $WeatherSummaryCopyWith<$Res> get weatherSummary;
}

/// @nodoc
class _$DisasterIntelligenceSummaryCopyWithImpl<$Res,
        $Val extends DisasterIntelligenceSummary>
    implements $DisasterIntelligenceSummaryCopyWith<$Res> {
  _$DisasterIntelligenceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeStatuses = null,
    Object? weatherSummary = null,
    Object? activeAlerts = null,
    Object? fiveDayForecast = null,
    Object? landslideZones = null,
    Object? routeClosures = null,
    Object? aiRecommendations = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      routeStatuses: null == routeStatuses
          ? _value.routeStatuses
          : routeStatuses // ignore: cast_nullable_to_non_nullable
              as List<RouteStatus>,
      weatherSummary: null == weatherSummary
          ? _value.weatherSummary
          : weatherSummary // ignore: cast_nullable_to_non_nullable
              as WeatherSummary,
      activeAlerts: null == activeAlerts
          ? _value.activeAlerts
          : activeAlerts // ignore: cast_nullable_to_non_nullable
              as List<AlertModel>,
      fiveDayForecast: null == fiveDayForecast
          ? _value.fiveDayForecast
          : fiveDayForecast // ignore: cast_nullable_to_non_nullable
              as List<ForecastModel>,
      landslideZones: null == landslideZones
          ? _value.landslideZones
          : landslideZones // ignore: cast_nullable_to_non_nullable
              as List<LandslideZone>,
      routeClosures: null == routeClosures
          ? _value.routeClosures
          : routeClosures // ignore: cast_nullable_to_non_nullable
              as List<RouteClosure>,
      aiRecommendations: null == aiRecommendations
          ? _value.aiRecommendations
          : aiRecommendations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherSummaryCopyWith<$Res> get weatherSummary {
    return $WeatherSummaryCopyWith<$Res>(_value.weatherSummary, (value) {
      return _then(_value.copyWith(weatherSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DisasterIntelligenceSummaryImplCopyWith<$Res>
    implements $DisasterIntelligenceSummaryCopyWith<$Res> {
  factory _$$DisasterIntelligenceSummaryImplCopyWith(
          _$DisasterIntelligenceSummaryImpl value,
          $Res Function(_$DisasterIntelligenceSummaryImpl) then) =
      __$$DisasterIntelligenceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RouteStatus> routeStatuses,
      WeatherSummary weatherSummary,
      List<AlertModel> activeAlerts,
      List<ForecastModel> fiveDayForecast,
      List<LandslideZone> landslideZones,
      List<RouteClosure> routeClosures,
      List<String> aiRecommendations,
      DateTime lastUpdated});

  @override
  $WeatherSummaryCopyWith<$Res> get weatherSummary;
}

/// @nodoc
class __$$DisasterIntelligenceSummaryImplCopyWithImpl<$Res>
    extends _$DisasterIntelligenceSummaryCopyWithImpl<$Res,
        _$DisasterIntelligenceSummaryImpl>
    implements _$$DisasterIntelligenceSummaryImplCopyWith<$Res> {
  __$$DisasterIntelligenceSummaryImplCopyWithImpl(
      _$DisasterIntelligenceSummaryImpl _value,
      $Res Function(_$DisasterIntelligenceSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeStatuses = null,
    Object? weatherSummary = null,
    Object? activeAlerts = null,
    Object? fiveDayForecast = null,
    Object? landslideZones = null,
    Object? routeClosures = null,
    Object? aiRecommendations = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$DisasterIntelligenceSummaryImpl(
      routeStatuses: null == routeStatuses
          ? _value._routeStatuses
          : routeStatuses // ignore: cast_nullable_to_non_nullable
              as List<RouteStatus>,
      weatherSummary: null == weatherSummary
          ? _value.weatherSummary
          : weatherSummary // ignore: cast_nullable_to_non_nullable
              as WeatherSummary,
      activeAlerts: null == activeAlerts
          ? _value._activeAlerts
          : activeAlerts // ignore: cast_nullable_to_non_nullable
              as List<AlertModel>,
      fiveDayForecast: null == fiveDayForecast
          ? _value._fiveDayForecast
          : fiveDayForecast // ignore: cast_nullable_to_non_nullable
              as List<ForecastModel>,
      landslideZones: null == landslideZones
          ? _value._landslideZones
          : landslideZones // ignore: cast_nullable_to_non_nullable
              as List<LandslideZone>,
      routeClosures: null == routeClosures
          ? _value._routeClosures
          : routeClosures // ignore: cast_nullable_to_non_nullable
              as List<RouteClosure>,
      aiRecommendations: null == aiRecommendations
          ? _value._aiRecommendations
          : aiRecommendations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisasterIntelligenceSummaryImpl
    implements _DisasterIntelligenceSummary {
  const _$DisasterIntelligenceSummaryImpl(
      {required final List<RouteStatus> routeStatuses,
      required this.weatherSummary,
      required final List<AlertModel> activeAlerts,
      required final List<ForecastModel> fiveDayForecast,
      required final List<LandslideZone> landslideZones,
      required final List<RouteClosure> routeClosures,
      required final List<String> aiRecommendations,
      required this.lastUpdated})
      : _routeStatuses = routeStatuses,
        _activeAlerts = activeAlerts,
        _fiveDayForecast = fiveDayForecast,
        _landslideZones = landslideZones,
        _routeClosures = routeClosures,
        _aiRecommendations = aiRecommendations;

  factory _$DisasterIntelligenceSummaryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DisasterIntelligenceSummaryImplFromJson(json);

  final List<RouteStatus> _routeStatuses;
  @override
  List<RouteStatus> get routeStatuses {
    if (_routeStatuses is EqualUnmodifiableListView) return _routeStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routeStatuses);
  }

  @override
  final WeatherSummary weatherSummary;
  final List<AlertModel> _activeAlerts;
  @override
  List<AlertModel> get activeAlerts {
    if (_activeAlerts is EqualUnmodifiableListView) return _activeAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeAlerts);
  }

  final List<ForecastModel> _fiveDayForecast;
  @override
  List<ForecastModel> get fiveDayForecast {
    if (_fiveDayForecast is EqualUnmodifiableListView) return _fiveDayForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fiveDayForecast);
  }

  final List<LandslideZone> _landslideZones;
  @override
  List<LandslideZone> get landslideZones {
    if (_landslideZones is EqualUnmodifiableListView) return _landslideZones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_landslideZones);
  }

  final List<RouteClosure> _routeClosures;
  @override
  List<RouteClosure> get routeClosures {
    if (_routeClosures is EqualUnmodifiableListView) return _routeClosures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routeClosures);
  }

  final List<String> _aiRecommendations;
  @override
  List<String> get aiRecommendations {
    if (_aiRecommendations is EqualUnmodifiableListView)
      return _aiRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aiRecommendations);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'DisasterIntelligenceSummary(routeStatuses: $routeStatuses, weatherSummary: $weatherSummary, activeAlerts: $activeAlerts, fiveDayForecast: $fiveDayForecast, landslideZones: $landslideZones, routeClosures: $routeClosures, aiRecommendations: $aiRecommendations, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisasterIntelligenceSummaryImpl &&
            const DeepCollectionEquality()
                .equals(other._routeStatuses, _routeStatuses) &&
            (identical(other.weatherSummary, weatherSummary) ||
                other.weatherSummary == weatherSummary) &&
            const DeepCollectionEquality()
                .equals(other._activeAlerts, _activeAlerts) &&
            const DeepCollectionEquality()
                .equals(other._fiveDayForecast, _fiveDayForecast) &&
            const DeepCollectionEquality()
                .equals(other._landslideZones, _landslideZones) &&
            const DeepCollectionEquality()
                .equals(other._routeClosures, _routeClosures) &&
            const DeepCollectionEquality()
                .equals(other._aiRecommendations, _aiRecommendations) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_routeStatuses),
      weatherSummary,
      const DeepCollectionEquality().hash(_activeAlerts),
      const DeepCollectionEquality().hash(_fiveDayForecast),
      const DeepCollectionEquality().hash(_landslideZones),
      const DeepCollectionEquality().hash(_routeClosures),
      const DeepCollectionEquality().hash(_aiRecommendations),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisasterIntelligenceSummaryImplCopyWith<_$DisasterIntelligenceSummaryImpl>
      get copyWith => __$$DisasterIntelligenceSummaryImplCopyWithImpl<
          _$DisasterIntelligenceSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisasterIntelligenceSummaryImplToJson(
      this,
    );
  }
}

abstract class _DisasterIntelligenceSummary
    implements DisasterIntelligenceSummary {
  const factory _DisasterIntelligenceSummary(
      {required final List<RouteStatus> routeStatuses,
      required final WeatherSummary weatherSummary,
      required final List<AlertModel> activeAlerts,
      required final List<ForecastModel> fiveDayForecast,
      required final List<LandslideZone> landslideZones,
      required final List<RouteClosure> routeClosures,
      required final List<String> aiRecommendations,
      required final DateTime lastUpdated}) = _$DisasterIntelligenceSummaryImpl;

  factory _DisasterIntelligenceSummary.fromJson(Map<String, dynamic> json) =
      _$DisasterIntelligenceSummaryImpl.fromJson;

  @override
  List<RouteStatus> get routeStatuses;
  @override
  WeatherSummary get weatherSummary;
  @override
  List<AlertModel> get activeAlerts;
  @override
  List<ForecastModel> get fiveDayForecast;
  @override
  List<LandslideZone> get landslideZones;
  @override
  List<RouteClosure> get routeClosures;
  @override
  List<String> get aiRecommendations;
  @override
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$DisasterIntelligenceSummaryImplCopyWith<_$DisasterIntelligenceSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
