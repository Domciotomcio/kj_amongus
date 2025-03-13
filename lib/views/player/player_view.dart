import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';
import 'package:kj_amongus/services/providers/game_state_provider.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:kj_amongus/services/providers/player_state_provider.dart';
import 'package:kj_amongus/services/providers/team_service_provider.dart';
import 'package:kj_amongus/services/providers/team_state_provider.dart';
import 'package:kj_amongus/views/login_view.dart';
import 'package:kj_amongus/views/player/map_view.dart';
import 'package:kj_amongus/views/player/report_task_view.dart';

class PlayerView extends HookConsumerWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Widok gry'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MapView())),
              icon: Icon(Icons.map)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (route) => false);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: gameState.when(
        data: (gameState) {
          return gameState == GameState.game
              ? FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReportTaskView()));
                  },
                  label: Text("Zgłoś zadanie"),
                  icon: Icon(Icons.add),
                )
              : null;
        },
        error: (error, stack) => null,
        loading: () => null,
      ),
      body: gameState.when(data: (gameState) {
        switch (gameState) {
          case GameState.lobby:
            return LobbyWidget();
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
          RichText(
            text: TextSpan(
              text: "Jesteś zalogowany jako: ",
              children: [
                TextSpan(
                  text: player.nickname,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TeamWidget(),
          SizedBox(
            height: 30,
          ),
          TasksWidget(),
        ],
      ),
    );
  }
}

class LobbyWidget extends ConsumerWidget {
  const LobbyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);

    return playerState.when(
        data: (data) => Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dołączyłeś do gry jako: ${data.nickname}"),
                Text("Czekaj na rozpoczęcie gry"),
              ],
            )),
        error: (error, stack) => Text("Error: $error"),
        loading: () => Center(child: CircularProgressIndicator()));
  }
}

class TasksWidget extends ConsumerWidget {
  const TasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamState = ref.watch(teamStateProvider);

    return teamState.when(data: (team) {
      return Column(
        children: [
          Text("Wasze zadania:"),
          ...team.tasks.map((task) => ListTile(
                title: Text(task.name,
                    style: TextStyle(
                        decoration:
                            task.isDone ? TextDecoration.lineThrough : null)),
                subtitle: Text(task.description,
                    style: TextStyle(
                        decoration:
                            task.isDone ? TextDecoration.lineThrough : null)),
                trailing: task.isDone ? Icon(Icons.check) : null,
              ))
        ],
      );
    }, error: (error, stack) {
      return Text("Error: $error");
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}

class TeamWidget extends ConsumerWidget {
  const TeamWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamState = ref.watch(teamStateProvider);

    return teamState.when(data: (team) {
      return RichText(
          text: TextSpan(text: "Twoja drużyna: ", children: [
        TextSpan(
            text: team.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic))
      ]));
    }, error: (error, stack) {
      return Text("Error: $error");
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
