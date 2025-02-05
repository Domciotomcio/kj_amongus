import 'package:flutter/material.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/views/game_manager/game_manager_player_view.dart';

class GameView extends StatelessWidget {
  final GameService gameService = GameService();
  final PlayerService playerService = PlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game View'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder(
              stream: gameService.getGameStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  final game = snapshot.data;
                  return Column(
                    children: [
                      Text("Game: ${game!.name}"),
                      Text(game.toString()),
                      Divider(),
                      Text("Postęp zadań"),
                      Text(
                          "Liczba zrobionych tasków ${game.completedTasksNumber}/${game.allTasksNumber}"),
                      LinearProgressIndicator(
                        value: game.completedTasksNumber / game.allTasksNumber,
                      ),
                      Divider(),
                    ],
                  );
                } else {
                  return Text("Idk what happened");
                }
              }),
          Expanded(
            child: StreamBuilder(
                stream: playerService.getPlayersStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Show loading indicator
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    final players = snapshot.data;
                    return ListView.builder(
                      itemCount: players!.length,
                      itemBuilder: (context, index) {
                        final player = players[index];
                        return ListTile(
                            title: Text("${player.nickname}"),
                            subtitle: Text(
                                "Czy dalej zyje - ${player.isAlive.toString()}"),
                            trailing: player.fraction != null
                                ? Text(player.fraction!.name)
                                : null,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameManagerPlayerView(
                                        playerId: player.id))));
                      },
                    );
                  } else {
                    return Text("Idk what happened");
                  }
                }),
          ),
          ElevatedButton(
              onPressed: () async {
                // start game
                final gameStarted = await gameService.startGame();
                if (gameStarted) {
                  // show snackbar
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Game started")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error starting game")));
                }
              },
              child: Text("Start Game"))
        ],
      ),
    );
  }
}
