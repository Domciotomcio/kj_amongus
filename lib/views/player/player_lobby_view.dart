import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/views/player/player_finish_view.dart';
import 'package:kj_amongus/views/player/player_view.dart';

class PlayerLobbyView extends StatelessWidget {
  final PlayerService playerService = PlayerService();
  final GameService gameService = GameService();
  final String nickname;

  PlayerLobbyView({super.key, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Game>(
        stream: gameService.getGameStream(),
        builder: (context, gameSnapshot) {
          // Start Game
          if (gameSnapshot.hasData && gameSnapshot.data!.isStarted) {
            // 🚀 Automatically navigate to PlayerView when game starts
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              final player = await playerService.getPlayerByNickname(nickname);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayerView(player: player)),
              );
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Lobby - czekaj na rozpoczęcie gry'),
            ),
            body: StreamBuilder(
                stream: playerService.getPlayersStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.hasData) {
                    final players = snapshot.data as List<Player>;
                    return Column(
                      children: [
                        Text("Dołączyłeś do gry jako: $nickname"),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: players.length,
                            itemBuilder: (context, index) {
                              final player = players[index];
                              return ListTile(
                                title: Text(player.nickname),
                                subtitle: Text(player.name),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          );
        });
  }
}
