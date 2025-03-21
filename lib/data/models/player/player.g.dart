// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      teamId: json['teamId'] as String?,
      fraction: $enumDecodeNullable(_$FractionEnumMap, json['fraction']),
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAlive: json['isAlive'] as bool?,
      votesNumber: (json['votesNumber'] as num?)?.toInt(),
      lastKillTimestamp: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastKillTimestamp'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'name': instance.name,
      'teamId': instance.teamId,
      'fraction': _$FractionEnumMap[instance.fraction],
      'tasks': instance.tasks,
      'isAlive': instance.isAlive,
      'votesNumber': instance.votesNumber,
      'lastKillTimestamp': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastKillTimestamp, const TimestampConverter().toJson),
    };

const _$FractionEnumMap = {
  Fraction.green: 'green',
  Fraction.blue: 'blue',
  Fraction.red: 'red',
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
