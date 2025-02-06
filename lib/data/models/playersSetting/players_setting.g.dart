// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayersSettingImpl _$$PlayersSettingImplFromJson(Map<String, dynamic> json) =>
    _$PlayersSettingImpl(
      id: json['id'] as String,
      blueNumber: (json['blueNumber'] as num).toInt(),
      greenNumber: (json['greenNumber'] as num).toInt(),
      redNumber: (json['redNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$PlayersSettingImplToJson(
        _$PlayersSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blueNumber': instance.blueNumber,
      'greenNumber': instance.greenNumber,
      'redNumber': instance.redNumber,
    };
