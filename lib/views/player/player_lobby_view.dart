import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/player_service.dart';

class PlayerLobbyView extends StatelessWidget {
  final PlayerService playerService = PlayerService();
  final String nickname;

  PlayerLobbyView({super.key, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lobby - czekaj na rozpoczęcie gry'),
      ),
      body: StreamBuilder(
          stream: playerService.getPlayersStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.hasData) {
              final players = snapshot.data as List<Player>;
              return Column(
                children: [
                  Text("Dołączyłeś do gry jako: $nickname"),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        final player = players[index];
                        return ListTile(
                          title: Text(player.nickname),
                          subtitle: Text(player.name),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
