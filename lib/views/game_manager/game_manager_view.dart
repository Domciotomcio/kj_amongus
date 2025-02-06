import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/playersSetting/players_setting.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/services/player_setting_service.dart';
import 'package:kj_amongus/views/game_manager/game_manager_player_view.dart';

class GameView extends StatelessWidget {
  final GameService gameService = GameService();
  final PlayerService playerService = PlayerService();
  final PlayerSettingService playersSe = PlayerSettingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game View'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                            value:
                                game.completedTasksNumber / game.allTasksNumber,
                          ),
                          Divider(),
                          Text("Stan gry"),
                          Text(game.state.toString()),
                          Divider(),
                        ],
                      );
                    } else {
                      return Text("Idk what happened");
                    }
                  }),
              Divider(),
              PlayersSettingWidget(),
              Divider(),
              StreamBuilder(
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
                        shrinkWrap: true,
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
                                      builder: (context) =>
                                          GameManagerPlayerView(
                                              playerId: player.id))));
                        },
                      );
                    } else {
                      return Text("Idk what happened");
                    }
                  }),
              Divider(),
              GameManagerButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayersSettingWidget extends StatelessWidget {
  final PlayerSettingService playerSettingService = PlayerSettingService();
  final TextEditingController blueController = TextEditingController();
  final TextEditingController redController = TextEditingController();
  final TextEditingController greenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: StreamBuilder(
          stream: PlayerSettingService().getPlayersSettingStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              final playersSetting = snapshot.data as PlayersSetting;
              return Column(
                children: [
                  Text("Ustaw liczbę frakcji dla graczy"),
                  Text(
                    "Nie zmieniaj po rozpoczęciu gry!!!  ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Row(
                    children: [
                      Text("Niebiescy:"),
                      SizedBox(width: 10),
                      Text(playersSetting.blueNumber.toString()),
                      SizedBox(width: 50),
                      Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Liczba niebieskich',
                          ),
                          controller: blueController,
                        ),
                      ),
                      TextButton(
                          onPressed: () =>
                              playerSettingService.setFractionNumber(
                                  Fraction.blue,
                                  int.parse(blueController.text)),
                          child: Text("Ustaw niebieskich")),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Zieloni:"),
                      SizedBox(width: 10),
                      Text(playersSetting.greenNumber.toString()),
                      SizedBox(width: 50),
                      Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Liczba zielonych',
                          ),
                          controller: greenController,
                        ),
                      ),
                      TextButton(
                          onPressed: () =>
                              playerSettingService.setFractionNumber(
                                  Fraction.green,
                                  int.parse(greenController.text)),
                          child: Text("Ustaw zielonych")),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Czerwoni:"),
                      SizedBox(width: 10),
                      Text(playersSetting.redNumber.toString()),
                      SizedBox(width: 50),
                      Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Liczba czerwonych',
                          ),
                          controller: redController,
                        ),
                      ),
                      TextButton(
                          onPressed: () =>
                              playerSettingService.setFractionNumber(
                                  Fraction.red, int.parse(redController.text)),
                          child: Text("Ustaw czerwonych")),
                    ],
                  ),
                ],
              );
            } else {
              return Text("Idk what happened");
            }
          }),
    );
  }
}

class GameManagerButtons extends StatelessWidget {
  final GameService gameService = GameService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Kliknij juz jak dołączą wszyscy gracze!!!"),
          SizedBox(height: 10),
          ElevatedButton(onPressed: null, child: Text("Assign Fractions")),
          SizedBox(height: 10),
          ElevatedButton(onPressed: null, child: Text("Assign Tasks")),
          Divider(),
          FilledButton(
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
