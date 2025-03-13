import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_state_provider.g.dart';

@riverpod
Stream<Player> playerState(Ref ref) {
  final playerId = "Domcio";
  final playerService = ref.watch(playerServiceProvider);
  return playerService.streamPlayer(playerId);
}