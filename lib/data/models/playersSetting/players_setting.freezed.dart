// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'players_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayersSetting _$PlayersSettingFromJson(Map<String, dynamic> json) {
  return _PlayersSetting.fromJson(json);
}

/// @nodoc
mixin _$PlayersSetting {
  String get id => throw _privateConstructorUsedError;
  int get blueNumber => throw _privateConstructorUsedError;
  int get greenNumber => throw _privateConstructorUsedError;
  int get redNumber => throw _privateConstructorUsedError;

  /// Serializes this PlayersSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayersSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayersSettingCopyWith<PlayersSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayersSettingCopyWith<$Res> {
  factory $PlayersSettingCopyWith(
          PlayersSetting value, $Res Function(PlayersSetting) then) =
      _$PlayersSettingCopyWithImpl<$Res, PlayersSetting>;
  @useResult
  $Res call({String id, int blueNumber, int greenNumber, int redNumber});
}

/// @nodoc
class _$PlayersSettingCopyWithImpl<$Res, $Val extends PlayersSetting>
    implements $PlayersSettingCopyWith<$Res> {
  _$PlayersSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayersSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blueNumber = null,
    Object? greenNumber = null,
    Object? redNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blueNumber: null == blueNumber
          ? _value.blueNumber
          : blueNumber // ignore: cast_nullable_to_non_nullable
              as int,
      greenNumber: null == greenNumber
          ? _value.greenNumber
          : greenNumber // ignore: cast_nullable_to_non_nullable
              as int,
      redNumber: null == redNumber
          ? _value.redNumber
          : redNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayersSettingImplCopyWith<$Res>
    implements $PlayersSettingCopyWith<$Res> {
  factory _$$PlayersSettingImplCopyWith(_$PlayersSettingImpl value,
          $Res Function(_$PlayersSettingImpl) then) =
      __$$PlayersSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int blueNumber, int greenNumber, int redNumber});
}

/// @nodoc
class __$$PlayersSettingImplCopyWithImpl<$Res>
    extends _$PlayersSettingCopyWithImpl<$Res, _$PlayersSettingImpl>
    implements _$$PlayersSettingImplCopyWith<$Res> {
  __$$PlayersSettingImplCopyWithImpl(
      _$PlayersSettingImpl _value, $Res Function(_$PlayersSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayersSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blueNumber = null,
    Object? greenNumber = null,
    Object? redNumber = null,
  }) {
    return _then(_$PlayersSettingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blueNumber: null == blueNumber
          ? _value.blueNumber
          : blueNumber // ignore: cast_nullable_to_non_nullable
              as int,
      greenNumber: null == greenNumber
          ? _value.greenNumber
          : greenNumber // ignore: cast_nullable_to_non_nullable
              as int,
      redNumber: null == redNumber
          ? _value.redNumber
          : redNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayersSettingImpl implements _PlayersSetting {
  _$PlayersSettingImpl(
      {required this.id,
      required this.blueNumber,
      required this.greenNumber,
      required this.redNumber});

  factory _$PlayersSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayersSettingImplFromJson(json);

  @override
  final String id;
  @override
  final int blueNumber;
  @override
  final int greenNumber;
  @override
  final int redNumber;

  @override
  String toString() {
    return 'PlayersSetting(id: $id, blueNumber: $blueNumber, greenNumber: $greenNumber, redNumber: $redNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayersSettingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blueNumber, blueNumber) ||
                other.blueNumber == blueNumber) &&
            (identical(other.greenNumber, greenNumber) ||
                other.greenNumber == greenNumber) &&
            (identical(other.redNumber, redNumber) ||
                other.redNumber == redNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, blueNumber, greenNumber, redNumber);

  /// Create a copy of PlayersSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayersSettingImplCopyWith<_$PlayersSettingImpl> get copyWith =>
      __$$PlayersSettingImplCopyWithImpl<_$PlayersSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayersSettingImplToJson(
      this,
    );
  }
}

abstract class _PlayersSetting implements PlayersSetting {
  factory _PlayersSetting(
      {required final String id,
      required final int blueNumber,
      required final int greenNumber,
      required final int redNumber}) = _$PlayersSettingImpl;

  factory _PlayersSetting.fromJson(Map<String, dynamic> json) =
      _$PlayersSettingImpl.fromJson;

  @override
  String get id;
  @override
  int get blueNumber;
  @override
  int get greenNumber;
  @override
  int get redNumber;

  /// Create a copy of PlayersSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayersSettingImplCopyWith<_$PlayersSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
