// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbyPlace _$NearbyPlaceFromJson(Map<String, dynamic> json) {
  return _NearbyPlace.fromJson(json);
}

/// @nodoc
mixin _$NearbyPlace {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isSafe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbyPlaceCopyWith<NearbyPlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyPlaceCopyWith<$Res> {
  factory $NearbyPlaceCopyWith(
          NearbyPlace value, $Res Function(NearbyPlace) then) =
      _$NearbyPlaceCopyWithImpl<$Res, NearbyPlace>;
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      double distance,
      String address,
      bool isSafe});
}

/// @nodoc
class _$NearbyPlaceCopyWithImpl<$Res, $Val extends NearbyPlace>
    implements $NearbyPlaceCopyWith<$Res> {
  _$NearbyPlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? distance = null,
    Object? address = null,
    Object? isSafe = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isSafe: null == isSafe
          ? _value.isSafe
          : isSafe // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyPlaceImplCopyWith<$Res>
    implements $NearbyPlaceCopyWith<$Res> {
  factory _$$NearbyPlaceImplCopyWith(
          _$NearbyPlaceImpl value, $Res Function(_$NearbyPlaceImpl) then) =
      __$$NearbyPlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      double distance,
      String address,
      bool isSafe});
}

/// @nodoc
class __$$NearbyPlaceImplCopyWithImpl<$Res>
    extends _$NearbyPlaceCopyWithImpl<$Res, _$NearbyPlaceImpl>
    implements _$$NearbyPlaceImplCopyWith<$Res> {
  __$$NearbyPlaceImplCopyWithImpl(
      _$NearbyPlaceImpl _value, $Res Function(_$NearbyPlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? distance = null,
    Object? address = null,
    Object? isSafe = null,
  }) {
    return _then(_$NearbyPlaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isSafe: null == isSafe
          ? _value.isSafe
          : isSafe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyPlaceImpl implements _NearbyPlace {
  const _$NearbyPlaceImpl(
      {required this.id,
      required this.name,
      required this.category,
      required this.distance,
      required this.address,
      this.isSafe = false});

  factory _$NearbyPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyPlaceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final double distance;
  @override
  final String address;
  @override
  @JsonKey()
  final bool isSafe;

  @override
  String toString() {
    return 'NearbyPlace(id: $id, name: $name, category: $category, distance: $distance, address: $address, isSafe: $isSafe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyPlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isSafe, isSafe) || other.isSafe == isSafe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, category, distance, address, isSafe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyPlaceImplCopyWith<_$NearbyPlaceImpl> get copyWith =>
      __$$NearbyPlaceImplCopyWithImpl<_$NearbyPlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyPlaceImplToJson(
      this,
    );
  }
}

abstract class _NearbyPlace implements NearbyPlace {
  const factory _NearbyPlace(
      {required final String id,
      required final String name,
      required final String category,
      required final double distance,
      required final String address,
      final bool isSafe}) = _$NearbyPlaceImpl;

  factory _NearbyPlace.fromJson(Map<String, dynamic> json) =
      _$NearbyPlaceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  double get distance;
  @override
  String get address;
  @override
  bool get isSafe;
  @override
  @JsonKey(ignore: true)
  _$$NearbyPlaceImplCopyWith<_$NearbyPlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
