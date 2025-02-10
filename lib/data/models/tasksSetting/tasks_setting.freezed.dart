// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TasksSetting _$TasksSettingFromJson(Map<String, dynamic> json) {
  return _TasksSetting.fromJson(json);
}

/// @nodoc
mixin _$TasksSetting {
  String get id => throw _privateConstructorUsedError;
  int get tasksShortNumber => throw _privateConstructorUsedError;
  int get tasksLongNumber => throw _privateConstructorUsedError;
  int get tasksCommonNumber => throw _privateConstructorUsedError;

  /// Serializes this TasksSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TasksSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TasksSettingCopyWith<TasksSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksSettingCopyWith<$Res> {
  factory $TasksSettingCopyWith(
          TasksSetting value, $Res Function(TasksSetting) then) =
      _$TasksSettingCopyWithImpl<$Res, TasksSetting>;
  @useResult
  $Res call(
      {String id,
      int tasksShortNumber,
      int tasksLongNumber,
      int tasksCommonNumber});
}

/// @nodoc
class _$TasksSettingCopyWithImpl<$Res, $Val extends TasksSetting>
    implements $TasksSettingCopyWith<$Res> {
  _$TasksSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tasksShortNumber = null,
    Object? tasksLongNumber = null,
    Object? tasksCommonNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tasksShortNumber: null == tasksShortNumber
          ? _value.tasksShortNumber
          : tasksShortNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tasksLongNumber: null == tasksLongNumber
          ? _value.tasksLongNumber
          : tasksLongNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tasksCommonNumber: null == tasksCommonNumber
          ? _value.tasksCommonNumber
          : tasksCommonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksSettingImplCopyWith<$Res>
    implements $TasksSettingCopyWith<$Res> {
  factory _$$TasksSettingImplCopyWith(
          _$TasksSettingImpl value, $Res Function(_$TasksSettingImpl) then) =
      __$$TasksSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int tasksShortNumber,
      int tasksLongNumber,
      int tasksCommonNumber});
}

/// @nodoc
class __$$TasksSettingImplCopyWithImpl<$Res>
    extends _$TasksSettingCopyWithImpl<$Res, _$TasksSettingImpl>
    implements _$$TasksSettingImplCopyWith<$Res> {
  __$$TasksSettingImplCopyWithImpl(
      _$TasksSettingImpl _value, $Res Function(_$TasksSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tasksShortNumber = null,
    Object? tasksLongNumber = null,
    Object? tasksCommonNumber = null,
  }) {
    return _then(_$TasksSettingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tasksShortNumber: null == tasksShortNumber
          ? _value.tasksShortNumber
          : tasksShortNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tasksLongNumber: null == tasksLongNumber
          ? _value.tasksLongNumber
          : tasksLongNumber // ignore: cast_nullable_to_non_nullable
              as int,
      tasksCommonNumber: null == tasksCommonNumber
          ? _value.tasksCommonNumber
          : tasksCommonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TasksSettingImpl implements _TasksSetting {
  const _$TasksSettingImpl(
      {required this.id,
      required this.tasksShortNumber,
      required this.tasksLongNumber,
      required this.tasksCommonNumber});

  factory _$TasksSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksSettingImplFromJson(json);

  @override
  final String id;
  @override
  final int tasksShortNumber;
  @override
  final int tasksLongNumber;
  @override
  final int tasksCommonNumber;

  @override
  String toString() {
    return 'TasksSetting(id: $id, tasksShortNumber: $tasksShortNumber, tasksLongNumber: $tasksLongNumber, tasksCommonNumber: $tasksCommonNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksSettingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tasksShortNumber, tasksShortNumber) ||
                other.tasksShortNumber == tasksShortNumber) &&
            (identical(other.tasksLongNumber, tasksLongNumber) ||
                other.tasksLongNumber == tasksLongNumber) &&
            (identical(other.tasksCommonNumber, tasksCommonNumber) ||
                other.tasksCommonNumber == tasksCommonNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tasksShortNumber, tasksLongNumber, tasksCommonNumber);

  /// Create a copy of TasksSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksSettingImplCopyWith<_$TasksSettingImpl> get copyWith =>
      __$$TasksSettingImplCopyWithImpl<_$TasksSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksSettingImplToJson(
      this,
    );
  }
}

abstract class _TasksSetting implements TasksSetting {
  const factory _TasksSetting(
      {required final String id,
      required final int tasksShortNumber,
      required final int tasksLongNumber,
      required final int tasksCommonNumber}) = _$TasksSettingImpl;

  factory _TasksSetting.fromJson(Map<String, dynamic> json) =
      _$TasksSettingImpl.fromJson;

  @override
  String get id;
  @override
  int get tasksShortNumber;
  @override
  int get tasksLongNumber;
  @override
  int get tasksCommonNumber;

  /// Create a copy of TasksSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksSettingImplCopyWith<_$TasksSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
