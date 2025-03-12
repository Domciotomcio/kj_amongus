import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/services/firestore/game_service.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';

Future<bool> clearAll() async {
  final PlayerService playerService = PlayerService();
  final GameService gameService = GameService();

  // remove all players
  await playerService.removePlayers();

  // clear all fields in game
  //await gameService.clearGame();

  return true;
}
