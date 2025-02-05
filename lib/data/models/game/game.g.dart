// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isStarted: json['isStarted'] as bool,
      isFinished: json['isFinished'] as bool,
      isEmergencyMeeting: json['isEmergencyMeeting'] as bool,
      emergencyMeetingStartedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['emergencyMeetingStartedAt'],
          const TimestampConverter().fromJson),
      playersNumber: (json['playersNumber'] as num).toInt(),
      allTasksNumber: (json['allTasksNumber'] as num).toInt(),
      completedTasksNumber: (json['completedTasksNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isStarted': instance.isStarted,
      'isFinished': instance.isFinished,
      'isEmergencyMeeting': instance.isEmergencyMeeting,
      'emergencyMeetingStartedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.emergencyMeetingStartedAt,
          const TimestampConverter().toJson),
      'playersNumber': instance.playersNumber,
      'allTasksNumber': instance.allTasksNumber,
      'completedTasksNumber': instance.completedTasksNumber,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
