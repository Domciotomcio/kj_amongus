import 'package:freezed_annotation/freezed_annotation.dart';

part 'players_setting.freezed.dart';
part 'players_setting.g.dart';

@freezed
class PlayersSetting with _$PlayersSetting {
  factory PlayersSetting({
    required String id,
    required int blueNumber,
    required int greenNumber,
    required int redNumber,
  }) = _PlayersSetting;

  factory PlayersSetting.fromJson(Map<String, dynamic> json) =>
      _$PlayersSettingFromJson(json);
}
