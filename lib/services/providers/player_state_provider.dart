import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/notifiers/player_state_notifier.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_state_provider.g.dart';

@riverpod
Stream<Player> playerState(Ref ref) {
  final playerState = ref.watch(playerStateNotifierProvider.notifier).state;

  final playerService = ref.watch(playerServiceProvider);
  return playerService.streamPlayer(playerState!.id);
}
