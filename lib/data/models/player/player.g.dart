// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      fraction: $enumDecode(_$FractionEnumMap, json['fraction']),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'name': instance.name,
      'fraction': _$FractionEnumMap[instance.fraction]!,
    };

const _$FractionEnumMap = {
  Fraction.green: 'green',
  Fraction.blue: 'blue',
  Fraction.red: 'red',
};
