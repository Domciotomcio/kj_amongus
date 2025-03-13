import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/notifiers/player_notifier.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/providers/game_state_provider.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:kj_amongus/views/login_view.dart';
import 'package:kj_amongus/views/player/map_view.dart';
import 'package:kj_amongus/views/player/report_task_view.dart';

class PlayerView extends HookConsumerWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerId = "Domcio";

    final PlayerService playerService = ref.watch(playerServiceProvider);
    final gameState = ref.watch(gameStateProvider);

    final playerState = ref.watch(playerStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Player View'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (route) => false);
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MapView())),
              icon: Icon(Icons.map)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ReportTaskView()));
        },
        label: Text("Zgłoś zadanie"),
        icon: Icon(Icons.add),
      ),
      body: gameState.when(data: (gameState) {
        switch (gameState) {
          case GameState.lobby:
            return Center(child: Text("Czekaj na rozpoczęcie gry"));
          case GameState.game:
            return playerData(Player(
                id: "Domcio",
                nickname: "Domcio",
                password: "1234",
                name: "Dominik"));
          case GameState.gameOver:
            return Center(child: Text("Gra zakończona"));
          default:
            return Center(child: Text("Nieznany stan gry"));
        }
      }, error: (error, stack) {
        return Text("Error: $error");
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),

      // body: Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   child: StreamBuilder(
      //       stream: playerService.streamPlayer(playerState!.id),
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return Center(
      //               child:
      //                   CircularProgressIndicator()); // Show loading indicator
      //         }
      //         if (snapshot.hasError) {
      //           return Text('Error: ${snapshot.error}');
      //         }
      //         if (snapshot.hasData) {
      //           final player = snapshot.data as Player;

      //           return playerData(player);
      //         } else {
      //           return Text("Idk what happened");
      //         }
      //       }),
      // ),
    );
  }

  Widget playerData(Player player) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Jesteś zalogowany jako: ${player.nickname}"),
          Text("Czekaj na rozpoczęcie gry"),
          Divider(),
          Text("Twoje zadania:"),
          ListTile(
            title: Text("Zadanie 1"),
            subtitle: Text("Wykonaj zadanie 1"),
          ),
          ListTile(
            title: Text("Zadanie 2"),
            subtitle: Text("Wykonaj zadanie 2"),
          ),
          ListTile(
            title: Text("Zadanie 3"),
            subtitle: Text("Wykonaj zadanie 3"),
          ),
          Divider(),
          Text("Twoja frakcja: ${player.fraction?.name}"),
          Divider(),
          Text("Postęp zadań twojej frakcji:"),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: 0.6,
          ),
          Divider(),
        ],
      ),
    );
  }
}
