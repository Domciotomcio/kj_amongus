import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/services/game_service.dart';

Future<bool> sabotateEngines() async {
  final GameService gameService = GameService();
  var game = await gameService.getGame();

  game = game.copyWith(
    state: GameState.sabotage,
  );

  return await gameService.updateGame(game);
}
