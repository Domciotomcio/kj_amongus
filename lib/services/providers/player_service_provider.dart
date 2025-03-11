import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_service_provider.g.dart';

@riverpod
PlayerService playerService(Ref ref) {
  return PlayerService();
}
