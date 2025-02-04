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
            FilledButton(
                onPressed: () {
                  // add player to firebase
                  playerService.createPlayer('nickname', 'name', 'fraction');
                  print("SIEMA");
                },
                child: Text("Add Player")),
          ],
        ),
      ),
    );
  }
}
