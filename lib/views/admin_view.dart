import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/controllers/team_controller.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/game_state_service.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';
import 'package:kj_amongus/services/providers/game_state_service_provider.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:kj_amongus/services/providers/team_controller_provider.dart';

class AdminView extends HookConsumerWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlayerService playerService = ref.watch(playerServiceProvider);
    final GameStateService gameStateService =
        ref.watch(gameStateServiceProvider);
    final TeamController teamController = ref.watch(teamControllerProvider);

    final TeamService teamService = TeamService();

    final teamCountController = useTextEditingController(text: '3');
    final tasksNumberController = useTextEditingController(text: '2');

    return Scaffold(
        appBar: AppBar(
          title: Text('Admin View'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Gracze'),
              StreamBuilder(
                  stream: playerService.streamPlayers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Show loading indicator
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      final players = snapshot.data as List<Player>;
                      return Column(
                        children: [
                          Text("Liczba graczy: ${players.length}"),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: players.length,
                            itemBuilder: (context, index) {
                              final player = players[index];
                              return ListTile(
                                title: Text(player.nickname),
                                subtitle: Text(player.name),
                                trailing: player.fraction != null
                                    ? Text(player.fraction!.name)
                                    : null,
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return Text("Idk what happened");
                    }
                  }),
              Divider(),
              Text("dodaj Teamy"),
              TextField(
                decoration: InputDecoration(labelText: 'liczba teamów'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: teamCountController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'liczba zadań'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: tasksNumberController,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await teamController.removeAllTeams();
                    await teamController
                        .createTeams(int.parse(teamCountController.text));
                    await teamController.assignTeamsToPlayers();

                    await teamController
                        .assignTasks(int.parse(tasksNumberController.text));
                  },
                  child: Text("Dodaj i przypisz teamy do graczy")),
              Divider(),
              Text('Postępy zadań'),
              Divider(),
              ElevatedButton(
                  onPressed: () =>
                      gameStateService.updateGameState(GameState.game),
                  child: Text("Rozpocznij grę")),
            ],
          ),
        ));
  }
}
