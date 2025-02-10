import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/services/game_service.dart';

class TaskProgressBar extends StatelessWidget {
  final GameService gameService = GameService();

  TaskProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: gameService.getGameStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show loading indicator
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.hasData) {
            final game = snapshot.data as Game;
            return Column(
              children: [
                Text("Postęp zadań"),
                Text(
                    "Liczba zrobionych tasków przez wszystkich graczy ${game.completedTasksNumber}/${game.allTasksNumber}"),
                if (game.allTasksNumber != 0)
                  LinearProgressIndicator(
                    value: game.completedTasksNumber / game.allTasksNumber,
                  ),
                Divider(),
              ],
            );
          } else {
            return Text("Idk what happened");
          }
        });
  }
}
