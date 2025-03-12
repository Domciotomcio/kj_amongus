import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/services/firestore/game_service.dart';

class SabotageWidget extends StatelessWidget {
  final GameService gameService = GameService();
  final bool impostorView;

  SabotageWidget({super.key, required this.impostorView});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: gameService.getGameStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final game = snapshot.data as Game;

          print("Game State: ${game.state}");

          if (game.state == GameState.sabotage) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.red),
                        const Text("Trwa sabotaz!"),
                        const Icon(Icons.warning, color: Colors.red),
                      ],
                    ),
                  ],
                ),
                if (impostorView)
                  Text(
                    "Jako impostor nie musisz nic naprawiać, a mozesz to wykorzystać!",
                    textAlign: TextAlign.center,
                  ),
                Divider(),
              ],
            );
          }

          return const SizedBox.shrink();
        });
  }
}
