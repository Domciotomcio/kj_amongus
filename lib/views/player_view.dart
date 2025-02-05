import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/player_service.dart';

class PlayerView extends StatelessWidget {
  final PlayerService playerService = PlayerService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
            return Body(player);
          } else {
            return Text("Idk what happened");
          }
        });
  }

  Scaffold Body(Player player) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gracz ${player.nickname}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Załoga"),
            if (player.fraction == Fraction.red)
              Text("Jesteś impostorem")
            else if (player.fraction == Fraction.blue)
              ListTile(
                title: Text("Jesteś członkiem załogi niebieskich",
                    style: TextStyle(color: Colors.blue)),
              )
            else if (player.fraction == Fraction.green)
              ListTile(
                title: Text("Jesteś członkiem załogi zielonych",
                    style: TextStyle(color: Colors.green)),
              )
            else
              Text("Spytaj prowadzącego z jakiej frakcji jesteś"),
            Divider(),
            Text("Stan"),
            ListTile(
              title: player.isAlive
                  ? Text(
                      "Dalej żyjesz",
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      "Nie żyjesz",
                      style: TextStyle(color: Colors.red),
                    ),
            ),
            Divider(),
            Text("Twoje zadania"),
            // if all tasks completed
            if (player.isAllTasksDone())
              Center(
                child: Text("Wszystkie zadania wykonane!",
                    style: TextStyle(color: Colors.green)),
              ),

            for (var task in player.tasks)
              ListTile(
                title: Text(
                  task.name,
                  style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                subtitle: Text(task.description),
                trailing: task.isDone ? Icon(Icons.check) : Icon(Icons.close),
                onTap: () => playerService.completeTask(player.id, task.id),
              ),
            Divider(),
            Center(
                child: FilledButton.icon(
              onPressed: null,
              label: Text("Skanuj kod QR"),
              icon: Icon(Icons.camera),
            )),
          ],
        ),
      ),
    );
  }
}
