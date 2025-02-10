// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskTemplate _$TaskTemplateFromJson(Map<String, dynamic> json) {
  return _TaskTemplate.fromJson(json);
}

/// @nodoc
mixin _$TaskTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this TaskTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskTemplateCopyWith<TaskTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTemplateCopyWith<$Res> {
  factory $TaskTemplateCopyWith(
          TaskTemplate value, $Res Function(TaskTemplate) then) =
      _$TaskTemplateCopyWithImpl<$Res, TaskTemplate>;
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class _$TaskTemplateCopyWithImpl<$Res, $Val extends TaskTemplate>
    implements $TaskTemplateCopyWith<$Res> {
  _$TaskTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskTemplateImplCopyWith<$Res>
    implements $TaskTemplateCopyWith<$Res> {
  factory _$$TaskTemplateImplCopyWith(
          _$TaskTemplateImpl value, $Res Function(_$TaskTemplateImpl) then) =
      __$$TaskTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class __$$TaskTemplateImplCopyWithImpl<$Res>
    extends _$TaskTemplateCopyWithImpl<$Res, _$TaskTemplateImpl>
    implements _$$TaskTemplateImplCopyWith<$Res> {
  __$$TaskTemplateImplCopyWithImpl(
      _$TaskTemplateImpl _value, $Res Function(_$TaskTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$TaskTemplateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskTemplateImpl implements _TaskTemplate {
  const _$TaskTemplateImpl(
      {required this.id, required this.name, required this.description});

  factory _$TaskTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'TaskTemplate(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskTemplateImplCopyWith<_$TaskTemplateImpl> get copyWith =>
      __$$TaskTemplateImplCopyWithImpl<_$TaskTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskTemplateImplToJson(
      this,
    );
  }
}

abstract class _TaskTemplate implements TaskTemplate {
  const factory _TaskTemplate(
      {required final String id,
      required final String name,
      required final String description}) = _$TaskTemplateImpl;

  factory _TaskTemplate.fromJson(Map<String, dynamic> json) =
      _$TaskTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of TaskTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskTemplateImplCopyWith<_$TaskTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
