import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/services/firestore/game_state_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state_provider.g.dart';

@riverpod
Stream<GameState> gameState(Ref ref) async* {
  final gameStateService = GameStateService();
  yield* gameStateService.streamGameState();
}
