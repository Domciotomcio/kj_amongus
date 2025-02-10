// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TasksSettingImpl _$$TasksSettingImplFromJson(Map<String, dynamic> json) =>
    _$TasksSettingImpl(
      id: json['id'] as String,
      tasksShortNumber: (json['tasksShortNumber'] as num).toInt(),
      tasksLongNumber: (json['tasksLongNumber'] as num).toInt(),
      tasksCommonNumber: (json['tasksCommonNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$TasksSettingImplToJson(_$TasksSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tasksShortNumber': instance.tasksShortNumber,
      'tasksLongNumber': instance.tasksLongNumber,
      'tasksCommonNumber': instance.tasksCommonNumber,
    };
