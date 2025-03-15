import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/firestore/game_state_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_state_service_provider.g.dart';

@riverpod
GameStateService gameStateService(Ref ref) {
  return GameStateService();
}
