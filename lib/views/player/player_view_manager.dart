import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/game_service.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/views/player/emergency_meeting/player_emergency_meeting_summary_view.dart';
import 'package:kj_amongus/views/player/emergency_meeting/player_emergency_meeting_view.dart';
import 'package:kj_amongus/views/player/player_finish_view.dart';
import 'package:kj_amongus/views/player/player_impostor_view.dart';
import 'package:kj_amongus/views/player/player_killed_view.dart';
import 'package:kj_amongus/views/player/player_lobby_view.dart';
import 'package:kj_amongus/views/player/player_sabotage_view.dart';
import 'package:kj_amongus/views/player/player_game_view.dart';
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
              if (player.fraction == Fraction.red) {
                return PlayerImpostorView(player: player);
              } else {
                return PlayerGameView(player: player);
              }
              // } else if (game.state.name == "emergencyMeeting") {
              //   return PlayerEmergencyMeetingView(
              //     player: player,
              //   );
              // } else if (game.state.name == "emergencyMeetingSummary") {
              //   return PlayerEmergencyMeetingSummaryView();
            } else if (game.state.name == "gameOver") {
              return PlayerGameOverView(
                player: player,
              );
            } else if (game.state.name == "sabotage") {
              if (player.fraction == Fraction.red) {
                return PlayerImpostorView(player: player);
              } else {
                return PlayerSabotageView(player: player);
              }
            } else {
              return const Text("Blad, skontaktuj sie z prowadzacym");
            }
          } else {
            return const Text("Blad, skontaktuj sie z prowadzacym");
          }
        });
  }
}
