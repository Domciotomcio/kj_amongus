import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/data/models/playersSetting/players_setting.dart';
import 'package:kj_amongus/services/functions/assign_fraction.dart';
import 'package:kj_amongus/services/functions/assign_tasks.dart';
import 'package:kj_amongus/services/firestore/game_service.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/player_setting_service.dart';
import 'package:kj_amongus/views/game_manager/game_manager_player_view.dart';
import 'package:kj_amongus/widgets/task_progress_bar.dart';

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
                          TaskProgressBar(),
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
              Divider(),
              GameOverButtons(),
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
  final PlayerService playerService = PlayerService();

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
          Text("SIEMA"),
          ElevatedButton(
              onPressed: () async {
                print("TAK!!");
                await assignFraction();
              },
              child: Text("Assign Fractions")),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => assignTasks(), child: Text("Assign Tasks")),
          ElevatedButton(
              onPressed: () => playerService.resetAllTasks(),
              child: Text("Reset Tasks")),
          Divider(),
          Text("Zarządzanie grą"),
          FilledButton(
              onPressed: () => gameService.startGame(),
              child: Text("Start gryyy")),
          SizedBox(height: 10),
          FilledButton(
            onPressed: () async {
              gameService.changeGameState(GameState.game);
            },
            child: Text("Głosowanie -> Gra"),
          ),
        ],
      ),
    );
  }
}

class GameOverButtons extends StatelessWidget {
  final GameService gameService = GameService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Koniec gry"),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => gameService.gameOver(Fraction.blue),
            child: Text("Wygrywają niebiescy"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => gameService.gameOver(Fraction.green),
            child: Text("Wygrywają zieloni"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => gameService.gameOver(Fraction.red),
            child: Text("Wygrywają czerwoni"),
          ),
        ],
      ),
    );
  }
}
