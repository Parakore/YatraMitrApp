// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  double get temperature => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get rainfall => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {double temperature,
      String condition,
      String description,
      double rainfall,
      double windSpeed,
      int humidity,
      String visibility,
      DateTime timestamp,
      String location});
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? condition = null,
    Object? description = null,
    Object? rainfall = null,
    Object? windSpeed = null,
    Object? humidity = null,
    Object? visibility = null,
    Object? timestamp = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherModelImplCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$WeatherModelImplCopyWith(
          _$WeatherModelImpl value, $Res Function(_$WeatherModelImpl) then) =
      __$$WeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      String condition,
      String description,
      double rainfall,
      double windSpeed,
      int humidity,
      String visibility,
      DateTime timestamp,
      String location});
}

/// @nodoc
class __$$WeatherModelImplCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$WeatherModelImpl>
    implements _$$WeatherModelImplCopyWith<$Res> {
  __$$WeatherModelImplCopyWithImpl(
      _$WeatherModelImpl _value, $Res Function(_$WeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? condition = null,
    Object? description = null,
    Object? rainfall = null,
    Object? windSpeed = null,
    Object? humidity = null,
    Object? visibility = null,
    Object? timestamp = null,
    Object? location = null,
  }) {
    return _then(_$WeatherModelImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherModelImpl implements _WeatherModel {
  const _$WeatherModelImpl(
      {required this.temperature,
      required this.condition,
      required this.description,
      required this.rainfall,
      required this.windSpeed,
      required this.humidity,
      required this.visibility,
      required this.timestamp,
      required this.location});

  factory _$WeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherModelImplFromJson(json);

  @override
  final double temperature;
  @override
  final String condition;
  @override
  final String description;
  @override
  final double rainfall;
  @override
  final double windSpeed;
  @override
  final int humidity;
  @override
  final String visibility;
  @override
  final DateTime timestamp;
  @override
  final String location;

  @override
  String toString() {
    return 'WeatherModel(temperature: $temperature, condition: $condition, description: $description, rainfall: $rainfall, windSpeed: $windSpeed, humidity: $humidity, visibility: $visibility, timestamp: $timestamp, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rainfall, rainfall) ||
                other.rainfall == rainfall) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      condition,
      description,
      rainfall,
      windSpeed,
      humidity,
      visibility,
      timestamp,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      __$$WeatherModelImplCopyWithImpl<_$WeatherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherModel implements WeatherModel {
  const factory _WeatherModel(
      {required final double temperature,
      required final String condition,
      required final String description,
      required final double rainfall,
      required final double windSpeed,
      required final int humidity,
      required final String visibility,
      required final DateTime timestamp,
      required final String location}) = _$WeatherModelImpl;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$WeatherModelImpl.fromJson;

  @override
  double get temperature;
  @override
  String get condition;
  @override
  String get description;
  @override
  double get rainfall;
  @override
  double get windSpeed;
  @override
  int get humidity;
  @override
  String get visibility;
  @override
  DateTime get timestamp;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return _ForecastModel.fromJson(json);
}

/// @nodoc
mixin _$ForecastModel {
  DateTime get date => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  double get rainfall => throw _privateConstructorUsedError;

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
      {DateTime date, double temperature, String condition, double rainfall});
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
    Object? temperature = null,
    Object? condition = null,
    Object? rainfall = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
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
      {DateTime date, double temperature, String condition, double rainfall});
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
    Object? temperature = null,
    Object? condition = null,
    Object? rainfall = null,
  }) {
    return _then(_$ForecastModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      rainfall: null == rainfall
          ? _value.rainfall
          : rainfall // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastModelImpl implements _ForecastModel {
  const _$ForecastModelImpl(
      {required this.date,
      required this.temperature,
      required this.condition,
      required this.rainfall});

  factory _$ForecastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastModelImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double temperature;
  @override
  final String condition;
  @override
  final double rainfall;

  @override
  String toString() {
    return 'ForecastModel(date: $date, temperature: $temperature, condition: $condition, rainfall: $rainfall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.rainfall, rainfall) ||
                other.rainfall == rainfall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, temperature, condition, rainfall);

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
      required final double temperature,
      required final String condition,
      required final double rainfall}) = _$ForecastModelImpl;

  factory _ForecastModel.fromJson(Map<String, dynamic> json) =
      _$ForecastModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get temperature;
  @override
  String get condition;
  @override
  double get rainfall;
  @override
  @JsonKey(ignore: true)
  _$$ForecastModelImplCopyWith<_$ForecastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherIntelligence _$WeatherIntelligenceFromJson(Map<String, dynamic> json) {
  return _WeatherIntelligence.fromJson(json);
}

/// @nodoc
mixin _$WeatherIntelligence {
  WeatherModel get current => throw _privateConstructorUsedError;
  List<ForecastModel> get forecasts => throw _privateConstructorUsedError;
  String get safetyRecommendation => throw _privateConstructorUsedError;
  List<String> get tips => throw _privateConstructorUsedError;
  String get riskLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherIntelligenceCopyWith<WeatherIntelligence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherIntelligenceCopyWith<$Res> {
  factory $WeatherIntelligenceCopyWith(
          WeatherIntelligence value, $Res Function(WeatherIntelligence) then) =
      _$WeatherIntelligenceCopyWithImpl<$Res, WeatherIntelligence>;
  @useResult
  $Res call(
      {WeatherModel current,
      List<ForecastModel> forecasts,
      String safetyRecommendation,
      List<String> tips,
      String riskLevel});

  $WeatherModelCopyWith<$Res> get current;
}

/// @nodoc
class _$WeatherIntelligenceCopyWithImpl<$Res, $Val extends WeatherIntelligence>
    implements $WeatherIntelligenceCopyWith<$Res> {
  _$WeatherIntelligenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? forecasts = null,
    Object? safetyRecommendation = null,
    Object? tips = null,
    Object? riskLevel = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
      forecasts: null == forecasts
          ? _value.forecasts
          : forecasts // ignore: cast_nullable_to_non_nullable
              as List<ForecastModel>,
      safetyRecommendation: null == safetyRecommendation
          ? _value.safetyRecommendation
          : safetyRecommendation // ignore: cast_nullable_to_non_nullable
              as String,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherModelCopyWith<$Res> get current {
    return $WeatherModelCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherIntelligenceImplCopyWith<$Res>
    implements $WeatherIntelligenceCopyWith<$Res> {
  factory _$$WeatherIntelligenceImplCopyWith(_$WeatherIntelligenceImpl value,
          $Res Function(_$WeatherIntelligenceImpl) then) =
      __$$WeatherIntelligenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherModel current,
      List<ForecastModel> forecasts,
      String safetyRecommendation,
      List<String> tips,
      String riskLevel});

  @override
  $WeatherModelCopyWith<$Res> get current;
}

/// @nodoc
class __$$WeatherIntelligenceImplCopyWithImpl<$Res>
    extends _$WeatherIntelligenceCopyWithImpl<$Res, _$WeatherIntelligenceImpl>
    implements _$$WeatherIntelligenceImplCopyWith<$Res> {
  __$$WeatherIntelligenceImplCopyWithImpl(_$WeatherIntelligenceImpl _value,
      $Res Function(_$WeatherIntelligenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? forecasts = null,
    Object? safetyRecommendation = null,
    Object? tips = null,
    Object? riskLevel = null,
  }) {
    return _then(_$WeatherIntelligenceImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
      forecasts: null == forecasts
          ? _value._forecasts
          : forecasts // ignore: cast_nullable_to_non_nullable
              as List<ForecastModel>,
      safetyRecommendation: null == safetyRecommendation
          ? _value.safetyRecommendation
          : safetyRecommendation // ignore: cast_nullable_to_non_nullable
              as String,
      tips: null == tips
          ? _value._tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherIntelligenceImpl implements _WeatherIntelligence {
  const _$WeatherIntelligenceImpl(
      {required this.current,
      required final List<ForecastModel> forecasts,
      required this.safetyRecommendation,
      required final List<String> tips,
      required this.riskLevel})
      : _forecasts = forecasts,
        _tips = tips;

  factory _$WeatherIntelligenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherIntelligenceImplFromJson(json);

  @override
  final WeatherModel current;
  final List<ForecastModel> _forecasts;
  @override
  List<ForecastModel> get forecasts {
    if (_forecasts is EqualUnmodifiableListView) return _forecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecasts);
  }

  @override
  final String safetyRecommendation;
  final List<String> _tips;
  @override
  List<String> get tips {
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tips);
  }

  @override
  final String riskLevel;

  @override
  String toString() {
    return 'WeatherIntelligence(current: $current, forecasts: $forecasts, safetyRecommendation: $safetyRecommendation, tips: $tips, riskLevel: $riskLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherIntelligenceImpl &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality()
                .equals(other._forecasts, _forecasts) &&
            (identical(other.safetyRecommendation, safetyRecommendation) ||
                other.safetyRecommendation == safetyRecommendation) &&
            const DeepCollectionEquality().equals(other._tips, _tips) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      current,
      const DeepCollectionEquality().hash(_forecasts),
      safetyRecommendation,
      const DeepCollectionEquality().hash(_tips),
      riskLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherIntelligenceImplCopyWith<_$WeatherIntelligenceImpl> get copyWith =>
      __$$WeatherIntelligenceImplCopyWithImpl<_$WeatherIntelligenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherIntelligenceImplToJson(
      this,
    );
  }
}

abstract class _WeatherIntelligence implements WeatherIntelligence {
  const factory _WeatherIntelligence(
      {required final WeatherModel current,
      required final List<ForecastModel> forecasts,
      required final String safetyRecommendation,
      required final List<String> tips,
      required final String riskLevel}) = _$WeatherIntelligenceImpl;

  factory _WeatherIntelligence.fromJson(Map<String, dynamic> json) =
      _$WeatherIntelligenceImpl.fromJson;

  @override
  WeatherModel get current;
  @override
  List<ForecastModel> get forecasts;
  @override
  String get safetyRecommendation;
  @override
  List<String> get tips;
  @override
  String get riskLevel;
  @override
  @JsonKey(ignore: true)
  _$$WeatherIntelligenceImplCopyWith<_$WeatherIntelligenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
