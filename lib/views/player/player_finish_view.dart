import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/game_service.dart';

class PlayerGameOverView extends StatelessWidget {
  final Player player;
  final GameService gameService = GameService();

  PlayerGameOverView({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koniec gry'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: gameService.getGameStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final game = snapshot.data as Game;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Wygrała druzyna'),
                Text(game.winningFraction!.name,
                    style: TextStyle(
                        color: game.winningFraction!.color, fontSize: 48)),
              ],
            );
          },
        ),
      ),
    );
  }
}
