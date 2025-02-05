// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      fraction: $enumDecodeNullable(_$FractionEnumMap, json['fraction']),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAlive: json['isAlive'] as bool,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'name': instance.name,
      'fraction': _$FractionEnumMap[instance.fraction],
      'tasks': instance.tasks,
      'isAlive': instance.isAlive,
    };

const _$FractionEnumMap = {
  Fraction.green: 'green',
  Fraction.blue: 'blue',
  Fraction.red: 'red',
};
