import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/views/player/player_emergency_meeting_view.dart';
import 'package:kj_amongus/views/player/player_finish_view.dart';
import 'package:kj_amongus/views/player/player_lobby_view.dart';
import 'package:kj_amongus/views/player/player_view.dart';

class PlayerViewManager extends StatelessWidget {
  final GameService gameService = GameService();
  final PlayerService playerService = PlayerService();
  final String nickname = "Domcio";

  PlayerViewManager({super.key, nickname}); // Later from join game view

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: gameService.getGameStream(),
        builder: (context, gameSnapshot) {
          if (gameSnapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (gameSnapshot.hasError) {
            return Text('Error: ${gameSnapshot.error}');
          }

          if (gameSnapshot.hasData) {
            final game = gameSnapshot.data as Game;
            if (game.state.name == "lobby") {
              return PlayerLobbyView(nickname: nickname);
            } else if (game.state.name == "game") {
              return PlayerGameView(nickname: nickname);
            } else if (game.state.name == "emergencyMeeting") {
              return PlayerEmergencyMeetingView();
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
