import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';

class GameManagerPlayerView extends StatelessWidget {
  final PlayerService playerService = PlayerService();
  final String playerId;

  // add playerId to constructor
  GameManagerPlayerView({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informacje o graczu'),
        ),
        body: StreamBuilder(
            stream: playerService.getPlayerStream(playerId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show loading indicator
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.hasData) {
                final player = snapshot.data as Player;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nick: ${player.nickname}"),
                    Text("Imię: ${player.name}"),
                    Text("Czy zyje: ${player.isAlive}"),
                    Text(
                        "Czy zrobił wszystkie taski: ${player.isAllTasksDone()}"),
                    Divider(),
                    Text("Taski:"),
                    for (var task in player.tasks ?? [])
                      Text("${task.name}, czy zrobione: ${task.isDone}"),
                  ],
                );
              } else {
                return Text("Idk what happened");
              }
            }));
  }
}
