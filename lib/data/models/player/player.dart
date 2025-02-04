import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String nickname,
    required String name,
    required Fraction fraction,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
