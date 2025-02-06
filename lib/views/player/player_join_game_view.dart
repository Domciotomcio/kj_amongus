import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/views/player/player_lobby_view.dart';
import 'package:kj_amongus/views/player/player_view.dart';
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
                  labelText: 'Nickname',
                ),
                controller: nicknameController,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                controller: nameController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // if game is already started
                  bool isGameStarted = await gameService.isGameStarted();
                  bool isPlayerExists = await playerService
                      .isPlayerExists(nicknameController.text);

                  // if is game started, then try to find player with this nickname and go to player_view

                  if (isGameStarted && !isPlayerExists) {
                    // error, game started, but player not found
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Nie znaleziono gracza o podanym nicku')));
                  }

                  if (!isPlayerExists) {
                    // player not found, create new player
                    await playerService.createPlayer(
                        nicknameController.text, nameController.text);
                  }

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayerViewManager(
                              nickname: nicknameController.text)),
                      (route) => false);
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
