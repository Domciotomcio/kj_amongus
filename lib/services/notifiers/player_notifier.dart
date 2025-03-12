import 'package:kj_amongus/data/models/player/player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerState extends _$PlayerState {
  @override
  Player? build() {
    return null;
  }

  void loadPlayer(Player player) {
    state = player;
  }
}
