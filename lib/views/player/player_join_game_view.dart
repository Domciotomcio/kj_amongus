import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/game_service.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/views/game_manager/game_manager_view.dart';
import 'package:kj_amongus/views/player/player_view_manager.dart';

class PlayerJoinGameView extends StatelessWidget {
  final PlayerService playerService = PlayerService();
  final GameService gameService = GameService();

  @override
  Widget build(BuildContext context) {
    TextEditingController nicknameController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dołącz do gry'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nickname (unikalny)',
                ),
                controller: nicknameController,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Imię',
                ),
                controller: nameController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (nicknameController.text == "adminadminadmin" &&
                      nameController.text == "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameView()),
                    );
                    return;
                  }

                  // if game is already started
                  bool isGameStarted = await gameService.isGameStarted();
                  bool isPlayerExists = await playerService
                      .isPlayerExists(nicknameController.text);

                  if (isGameStarted && !isPlayerExists) {
                    // error, game started, but player not found
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Nie znaleziono gracza o podanym nicku')));
                  }

                  if (!isPlayerExists) {
                    // player not found, create new player
                    // await playerService.createPlayer(
                    //     nicknameController.text.toUpperCase(),
                    //     nameController.text);
                  }

                  // Player player = await playerService.getPlayerByNickname(
                  //     nicknameController.text.toUpperCase());

                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PlayerViewManager(
                  //               player: player,
                  //             )),
                  //     (route) => false);
                },
                child: Text('Dołącz do gry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
