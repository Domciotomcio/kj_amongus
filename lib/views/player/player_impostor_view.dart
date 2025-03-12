import 'package:flutter/material.dart';
import 'package:kj_amongus/constants/const.dart';
import 'package:kj_amongus/constants/fake_tasks.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/functions/sabotate_engines.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/views/player/player_qr_view.dart';
import 'package:kj_amongus/widgets/sabotage_widget.dart';

class PlayerImpostorView extends StatelessWidget {
  final PlayerService playerService = PlayerService();
  final Player player;

  PlayerImpostorView({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gra Among Us'),
      ),
      body: StreamBuilder<Player>(
          stream: playerService.getPlayerStream(player.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return Text('Brak danych');
            }

            final player = snapshot.data as Player;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SabotageWidget(impostorView: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Zostałeś ',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Impostorem!',
                        style: TextStyle(fontSize: 24, color: Colors.red),
                      ),
                    ],
                  ),
                  Text("Twoim zadaniem jest eliminacja wszystkich graczy"),
                  Text("Pamiętaj, ze nie mozesz dać sie złapać!"),
                  Divider(),
                  Text(
                      "Nie musisz tego robić, ale mozesz udawać ze robisz taski:"),
                  for (final task in fakeTasks)
                    CheckboxListTile(
                      title: Text(task.name),
                      subtitle: Text(task.description),
                      value: task.isDone,
                      onChanged: (value) {
                        //task.isDone = value!;
                      },
                    ),
                  Divider(),
                  KillCountdownTimer(startTime: DateTime.now(), player: player),
                  Divider(),
                  SabotageCountdownTimer(startTime: DateTime.now()),
                ],
              ),
            );
          }),
    );
  }
}

class KillCountdownTimer extends StatelessWidget {
  final DateTime startTime;
  final Player player;

  KillCountdownTimer({required this.startTime, required this.player});

  Stream<int> _countdownStream() async* {
    while (true) {
      int elapsed = DateTime.now().difference(startTime).inSeconds;
      int remaining = timeToKill - elapsed;

      if (remaining > 0) {
        yield remaining;
        await Future.delayed(Duration(seconds: 1));
      } else {
        yield 0;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _countdownStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        int remaining = snapshot.data!;
        return Column(
          children: [
            Text(
              remaining > 0
                  ? "Mozesz eliminować za: $remaining s"
                  : "Pora kogoś wyeliminować!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // if (remaining <= 0)
            //   ElevatedButton(
            //     onPressed: () => PlayerQrView(player: player),
            //     child: Text("Eliminuj"),
            //   ),
          ],
        );
      },
    );
  }
}

class SabotageCountdownTimer extends StatelessWidget {
  final DateTime startTime;

  SabotageCountdownTimer({required this.startTime});

  Stream<int> _countdownStream() async* {
    while (true) {
      int elapsed = DateTime.now().difference(startTime).inSeconds;
      int remaining = timeToSabotage - elapsed;

      if (remaining > 0) {
        yield remaining;
        await Future.delayed(Duration(seconds: 1));
      } else {
        yield 0;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _countdownStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        int remaining = snapshot.data!;
        return Column(
          children: [
            Text(
              remaining > 0
                  ? "Mozesz przeprowadzić sabotaz za: $remaining s"
                  : "Pora coś zepsuć!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (remaining <= 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => sabotateEngines(),
                    child: Text("Sabotuj"),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
