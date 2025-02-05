import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/player_service.dart';

class PlayerView extends StatelessWidget {
  final PlayerService playerService = PlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Player View'),
        ),
        body: StreamBuilder(
            stream: playerService
                .getPlayerStream("15e08068-3032-41f5-8a82-5495d84ec82f"),
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
                  ],
                );
              } else {
                return Text("Idk what happened");
              }
            }));
  }
}
