// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Fraction? get fraction => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  bool? get isAlive => throw _privateConstructorUsedError;
  int? get votesNumber => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get lastKillTimestamp => throw _privateConstructorUsedError;

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {String id,
      String nickname,
      String password,
      String name,
      Fraction? fraction,
      List<Task>? tasks,
      bool? isAlive,
      int? votesNumber,
      @TimestampConverter() DateTime? lastKillTimestamp});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? password = null,
    Object? name = null,
    Object? fraction = freezed,
    Object? tasks = freezed,
    Object? isAlive = freezed,
    Object? votesNumber = freezed,
    Object? lastKillTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fraction: freezed == fraction
          ? _value.fraction
          : fraction // ignore: cast_nullable_to_non_nullable
              as Fraction?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      isAlive: freezed == isAlive
          ? _value.isAlive
          : isAlive // ignore: cast_nullable_to_non_nullable
              as bool?,
      votesNumber: freezed == votesNumber
          ? _value.votesNumber
          : votesNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lastKillTimestamp: freezed == lastKillTimestamp
          ? _value.lastKillTimestamp
          : lastKillTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nickname,
      String password,
      String name,
      Fraction? fraction,
      List<Task>? tasks,
      bool? isAlive,
      int? votesNumber,
      @TimestampConverter() DateTime? lastKillTimestamp});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? password = null,
    Object? name = null,
    Object? fraction = freezed,
    Object? tasks = freezed,
    Object? isAlive = freezed,
    Object? votesNumber = freezed,
    Object? lastKillTimestamp = freezed,
  }) {
    return _then(_$PlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fraction: freezed == fraction
          ? _value.fraction
          : fraction // ignore: cast_nullable_to_non_nullable
              as Fraction?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      isAlive: freezed == isAlive
          ? _value.isAlive
          : isAlive // ignore: cast_nullable_to_non_nullable
              as bool?,
      votesNumber: freezed == votesNumber
          ? _value.votesNumber
          : votesNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lastKillTimestamp: freezed == lastKillTimestamp
          ? _value.lastKillTimestamp
          : lastKillTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl extends _Player {
  const _$PlayerImpl(
      {required this.id,
      required this.nickname,
      required this.password,
      required this.name,
      this.fraction,
      final List<Task>? tasks,
      this.isAlive,
      this.votesNumber,
      @TimestampConverter() this.lastKillTimestamp})
      : _tasks = tasks,
        super._();

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final String id;
  @override
  final String nickname;
  @override
  final String password;
  @override
  final String name;
  @override
  final Fraction? fraction;
  final List<Task>? _tasks;
  @override
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isAlive;
  @override
  final int? votesNumber;
  @override
  @TimestampConverter()
  final DateTime? lastKillTimestamp;

  @override
  String toString() {
    return 'Player(id: $id, nickname: $nickname, password: $password, name: $name, fraction: $fraction, tasks: $tasks, isAlive: $isAlive, votesNumber: $votesNumber, lastKillTimestamp: $lastKillTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fraction, fraction) ||
                other.fraction == fraction) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.isAlive, isAlive) || other.isAlive == isAlive) &&
            (identical(other.votesNumber, votesNumber) ||
                other.votesNumber == votesNumber) &&
            (identical(other.lastKillTimestamp, lastKillTimestamp) ||
                other.lastKillTimestamp == lastKillTimestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nickname,
      password,
      name,
      fraction,
      const DeepCollectionEquality().hash(_tasks),
      isAlive,
      votesNumber,
      lastKillTimestamp);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player extends Player {
  const factory _Player(
      {required final String id,
      required final String nickname,
      required final String password,
      required final String name,
      final Fraction? fraction,
      final List<Task>? tasks,
      final bool? isAlive,
      final int? votesNumber,
      @TimestampConverter() final DateTime? lastKillTimestamp}) = _$PlayerImpl;
  const _Player._() : super._();

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String get password;
  @override
  String get name;
  @override
  Fraction? get fraction;
  @override
  List<Task>? get tasks;
  @override
  bool? get isAlive;
  @override
  int? get votesNumber;
  @override
  @TimestampConverter()
  DateTime? get lastKillTimestamp;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
