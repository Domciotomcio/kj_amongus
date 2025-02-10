import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/views/player/emergency_meeting/player_emergency_meeting_view.dart';
import 'package:kj_amongus/views/player/player_finish_view.dart';
import 'package:kj_amongus/views/player/player_killed_view.dart';
import 'package:kj_amongus/views/player/player_lobby_view.dart';
import 'package:kj_amongus/views/player/player_view.dart';
import 'package:rxdart/rxdart.dart';

class PlayerViewManager extends StatelessWidget {
  final GameService gameService = GameService();
  final PlayerService playerService = PlayerService();
  final Player player;

  PlayerViewManager(
      {super.key, required this.player}); // Later from join game view

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: CombineLatestStream.combine2(
            gameService.getGameStream(),
            playerService.getPlayerStream(player.id),
            (Game game, Player player) => {"game": game, "player": player}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.hasData) {
            final data = snapshot.data as Map<String, dynamic>;
            final game = data["game"] as Game;
            final player = data["player"] as Player;

            // if (player.isAlive == false) {
            //   return const PlayerKilledView();
            // }

            if (game.state.name == "lobby") {
              return PlayerLobbyView(player: player);
            } else if (game.state.name == "game") {
              return PlayerGameView(player: player);
            } else if (game.state.name == "emergencyMeeting") {
              return PlayerEmergencyMeetingView(
                player: player,
              );
            } else if (game.state.name == "gameOver") {
              return PlayerGameOverView();
            } else {
              return const Text("Blad, skontaktuj sie z prowadzacym");
            }
          } else {
            return const Text("Blad, skontaktuj sie z prowadzacym");
          }
        });
  }
}
