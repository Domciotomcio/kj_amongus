// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  GameState get state => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get emergencyMeetingStartedAt => throw _privateConstructorUsedError;
  int get playersNumber => throw _privateConstructorUsedError;
  int get allTasksNumber => throw _privateConstructorUsedError;
  int get completedTasksNumber => throw _privateConstructorUsedError;
  Fraction? get winnerFraction => throw _privateConstructorUsedError;

  /// Serializes this Game to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {String id,
      String name,
      GameState state,
      @TimestampConverter() DateTime? emergencyMeetingStartedAt,
      int playersNumber,
      int allTasksNumber,
      int completedTasksNumber,
      Fraction? winnerFraction});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? state = null,
    Object? emergencyMeetingStartedAt = freezed,
    Object? playersNumber = null,
    Object? allTasksNumber = null,
    Object? completedTasksNumber = null,
    Object? winnerFraction = freezed,
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
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameState,
      emergencyMeetingStartedAt: freezed == emergencyMeetingStartedAt
          ? _value.emergencyMeetingStartedAt
          : emergencyMeetingStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      playersNumber: null == playersNumber
          ? _value.playersNumber
          : playersNumber // ignore: cast_nullable_to_non_nullable
              as int,
      allTasksNumber: null == allTasksNumber
          ? _value.allTasksNumber
          : allTasksNumber // ignore: cast_nullable_to_non_nullable
              as int,
      completedTasksNumber: null == completedTasksNumber
          ? _value.completedTasksNumber
          : completedTasksNumber // ignore: cast_nullable_to_non_nullable
              as int,
      winnerFraction: freezed == winnerFraction
          ? _value.winnerFraction
          : winnerFraction // ignore: cast_nullable_to_non_nullable
              as Fraction?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      GameState state,
      @TimestampConverter() DateTime? emergencyMeetingStartedAt,
      int playersNumber,
      int allTasksNumber,
      int completedTasksNumber,
      Fraction? winnerFraction});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? state = null,
    Object? emergencyMeetingStartedAt = freezed,
    Object? playersNumber = null,
    Object? allTasksNumber = null,
    Object? completedTasksNumber = null,
    Object? winnerFraction = freezed,
  }) {
    return _then(_$GameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameState,
      emergencyMeetingStartedAt: freezed == emergencyMeetingStartedAt
          ? _value.emergencyMeetingStartedAt
          : emergencyMeetingStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      playersNumber: null == playersNumber
          ? _value.playersNumber
          : playersNumber // ignore: cast_nullable_to_non_nullable
              as int,
      allTasksNumber: null == allTasksNumber
          ? _value.allTasksNumber
          : allTasksNumber // ignore: cast_nullable_to_non_nullable
              as int,
      completedTasksNumber: null == completedTasksNumber
          ? _value.completedTasksNumber
          : completedTasksNumber // ignore: cast_nullable_to_non_nullable
              as int,
      winnerFraction: freezed == winnerFraction
          ? _value.winnerFraction
          : winnerFraction // ignore: cast_nullable_to_non_nullable
              as Fraction?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.id,
      required this.name,
      required this.state,
      @TimestampConverter() this.emergencyMeetingStartedAt,
      required this.playersNumber,
      required this.allTasksNumber,
      required this.completedTasksNumber,
      this.winnerFraction});

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final GameState state;
  @override
  @TimestampConverter()
  final DateTime? emergencyMeetingStartedAt;
  @override
  final int playersNumber;
  @override
  final int allTasksNumber;
  @override
  final int completedTasksNumber;
  @override
  final Fraction? winnerFraction;

  @override
  String toString() {
    return 'Game(id: $id, name: $name, state: $state, emergencyMeetingStartedAt: $emergencyMeetingStartedAt, playersNumber: $playersNumber, allTasksNumber: $allTasksNumber, completedTasksNumber: $completedTasksNumber, winnerFraction: $winnerFraction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.emergencyMeetingStartedAt,
                    emergencyMeetingStartedAt) ||
                other.emergencyMeetingStartedAt == emergencyMeetingStartedAt) &&
            (identical(other.playersNumber, playersNumber) ||
                other.playersNumber == playersNumber) &&
            (identical(other.allTasksNumber, allTasksNumber) ||
                other.allTasksNumber == allTasksNumber) &&
            (identical(other.completedTasksNumber, completedTasksNumber) ||
                other.completedTasksNumber == completedTasksNumber) &&
            (identical(other.winnerFraction, winnerFraction) ||
                other.winnerFraction == winnerFraction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      state,
      emergencyMeetingStartedAt,
      playersNumber,
      allTasksNumber,
      completedTasksNumber,
      winnerFraction);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final String id,
      required final String name,
      required final GameState state,
      @TimestampConverter() final DateTime? emergencyMeetingStartedAt,
      required final int playersNumber,
      required final int allTasksNumber,
      required final int completedTasksNumber,
      final Fraction? winnerFraction}) = _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  GameState get state;
  @override
  @TimestampConverter()
  DateTime? get emergencyMeetingStartedAt;
  @override
  int get playersNumber;
  @override
  int get allTasksNumber;
  @override
  int get completedTasksNumber;
  @override
  Fraction? get winnerFraction;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
