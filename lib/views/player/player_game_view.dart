import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/game_service.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/views/player/player_qr_view.dart';
import 'package:kj_amongus/widgets/task_progress_bar.dart';

class PlayerGameView extends StatelessWidget {
  final PlayerService playerService = PlayerService();
  final GameService gameService = GameService();
  final Player player;

  PlayerGameView({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: gameService.getGameStream(),
        builder: (context, gameSnapshot) {
          return StreamBuilder(
              stream: playerService.getPlayerStream(player.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  final player = snapshot.data as Player;

                  // Show dialog if player is not alive
                  // if (!player.isAlive) {
                  //   WidgetsBinding.instance.addPostFrameCallback((_) {
                  //     showDialog(
                  //       context: context,
                  //       barrierDismissible:
                  //           false, // Prevent dismissing by tapping outside
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           backgroundColor: Colors.red,
                  //           title: Text('Nie żyjesz'),
                  //           content: Text('Dokończ swoje zadani jako duch'),
                  //           actions: <Widget>[
                  //             TextButton(
                  //               child: Text('OK'),
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   });
                  // }

                  return Body(player, context);
                } else {
                  return Text("Idk what happened");
                }
              });
        });
  }

  Scaffold Body(Player player, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gracz ${player.nickname}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskProgressBar(),
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
              // ListTile(
              //   title: player.isAlive
              //       ? Text(
              //           "Dalej żyjesz",
              //           style: TextStyle(color: Colors.green),
              //         )
              //       : Text(
              //           "Nie żyjesz",
              //           style: TextStyle(color: Colors.red),
              //         ),
              //   subtitle: Text("Pamiętaj, by zrealizować wszystkie zadania"),
              // ),
              Divider(),
              Text("Twoje zadania"),
              // if all tasks completed
              if (player.isAllTasksDone())
                Center(
                  child: Text("Wszystkie zadania wykonane!",
                      style: TextStyle(color: Colors.green)),
                ),

              for (var task in player.tasks ?? [])
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
                  // onTap: () => playerService.completeTask(player.id, task.id),
                ),
              Divider(),
              // Center(
              //     child: FilledButton.icon(
              //   onPressed: () => Navigator.push(
              //       context,
              //       // MaterialPageRoute(
              //       //     builder: (context) => PlayerQrView(
              //       //           player: player,
              //       //         )),
              //               ),
              //   label: Text("Skanuj kod QR"),
              //   icon: Icon(Icons.camera),
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
