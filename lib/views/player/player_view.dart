import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/game_over_service.dart';
import 'package:kj_amongus/services/firestore/game_state_service.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';
import 'package:kj_amongus/services/providers/game_state_provider.dart';
import 'package:kj_amongus/services/providers/player_state_provider.dart';
import 'package:kj_amongus/services/providers/team_state_provider.dart';
import 'package:kj_amongus/views/login_view.dart';
import 'package:kj_amongus/views/player/map_view.dart';
import 'package:kj_amongus/views/player/report_task_view.dart';

class PlayerView extends HookConsumerWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final playerState = ref.watch(playerStateProvider);

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
            return playerState.when(
                data: (player) => playerData(player),
                error: (error, stack) {
                  return Text("Error: $error");
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                });
          case GameState.gameOver:
            return Center(child: GameOverWidget());

          default:
            return Center(child: Text("Nieznany stan gry"));
        }
      }, error: (error, stack) {
        return Text("Error: $error");
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
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
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: player.nickname,
                  style: TextStyle(
                      color: Colors.white,
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
          Divider(),
          GameOverButtonWidget(),
        ],
      ),
    );
  }
}

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GameOverService gameOverService = GameOverService();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<String>(
          future: gameOverService.getWinner(),
          builder: (context, snapshot) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gra zakończona"),
                  Text("Wygrała drużyna:"),
                  SizedBox(height: 20),
                  Text(snapshot.data!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "The Godfather",
                          fontSize: 40)),
                  SizedBox(height: 20),
                  Text(
                      "Dziękujemy za udział, możesz wrócić na miejsce startu i wylogować się"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginView()),
                          (route) => false);
                    },
                    child: Text("Wyloguj"),
                  ),
                ]);
          }),
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
          Text("Wasze zadania:", style: TextStyle(fontStyle: FontStyle.italic)),
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
          text: TextSpan(
              text: "Twoja drużyna: ",
              style: TextStyle(color: Colors.white),
              children: [
            TextSpan(
                text: team.name,
                style: TextStyle(
                    color: Colors.white,
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

class GameOverButtonWidget extends ConsumerWidget {
  const GameOverButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameStateService gameStateService = GameStateService();
    final teamState = ref.watch(teamStateProvider);
    final TeamService teamService = TeamService();
    final GameOverService gameOverService = GameOverService();

    return teamState.when(data: (team) {
      final isAllTasksDone = team.tasks.every((task) => task.isDone);
      if (isAllTasksDone) {
        return FilledButton(
          onPressed: () {
            gameOverService.setWinner(team.name);
            gameStateService.updateGameState(GameState.gameOver);
          },
          child: Text("Zakończ grę"),
        );
      } else {
        return Text("Wszystkie zadania nie są jeszcze zakończone",
            style: TextStyle(fontStyle: FontStyle.italic));
      }
    }, error: (error, stack) {
      return Text("Error: $error");
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
