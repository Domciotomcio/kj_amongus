import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/player_service.dart';

class PlayerTestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlayerService playerService = PlayerService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Player Test View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Player Test View',
            ),
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
                      final players = snapshot.data as List<Player>;
                      return ListView.builder(
                        itemCount: players.length,
                        itemBuilder: (context, index) {
                          final player = players[index];
                          return ListTile(
                            title: Text(
                                "${player.nickname} ${player.name} ${player.id}"),
                            subtitle: Text(player.tasks.toString()),
                            trailing: player.fraction != null
                                ? Text(player.fraction!.name)
                                : null,
                          );
                        },
                      );
                    } else {
                      return Text("Idk what happened");
                    }
                  }),
            ),
            FilledButton(
                onPressed: () {
                  // add player to firebase
                  // playerService.createPlayer('nickname', 'name');
                  print("SIEMA");
                },
                child: Text("Add Player")),
            FilledButton(
                onPressed: () {
                  // remove all the players
                  playerService.removeAllPlayers();
                },
                child: Text("Remove All Players")),
            FilledButton(
                onPressed: () {
                  // add tasks to all players
                  playerService.addTasksToPlayers();
                },
                child: Text("Add Tasks to Players")),
            Divider(),
            ElevatedButton(onPressed: null, child: Text("Start Game")),
          ],
        ),
      ),
    );
  }
}
