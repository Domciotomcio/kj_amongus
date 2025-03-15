import 'package:kj_amongus/data/models/player/player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_state_notifier.g.dart';

@riverpod
class PlayerStateNotifier extends _$PlayerStateNotifier {
  @override
  Player? build() {
    return null;
  }

  void updatePlayer(Player player) {
    state = player;
  }
}
