import 'package:flutter/material.dart';
import 'package:kj_amongus/constants/fake_tasks.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/widgets/sabotage_widget.dart';

class PlayerImpostorView extends StatelessWidget {
  final PlayerService playerService = PlayerService();

  PlayerImpostorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gra Among Us'),
      ),
      body: StreamBuilder<Player>(
          stream: playerService.getPlayerStream("PLAYER10"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final player = snapshot.data!;

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
                  KillCountdownTimer(
                      startTime: DateTime.now(), countdownSeconds: 5),
                  Divider(),
                  SabotageCountdownTimer(
                      startTime: DateTime.now(), countdownSeconds: 6),
                ],
              ),
            );
          }),
    );
  }
}

class KillCountdownTimer extends StatelessWidget {
  final DateTime startTime;
  final int countdownSeconds;

  KillCountdownTimer({required this.startTime, this.countdownSeconds = 10});

  Stream<int> _countdownStream() async* {
    while (true) {
      int elapsed = DateTime.now().difference(startTime).inSeconds;
      int remaining = countdownSeconds - elapsed;

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
            if (remaining <= 0)
              ElevatedButton(
                onPressed: null,
                child: Text("Eliminuj"),
              ),
          ],
        );
      },
    );
  }
}

class SabotageCountdownTimer extends StatelessWidget {
  final DateTime startTime;
  final int countdownSeconds;

  SabotageCountdownTimer(
      {required this.startTime, required this.countdownSeconds});

  Stream<int> _countdownStream() async* {
    while (true) {
      int elapsed = DateTime.now().difference(startTime).inSeconds;
      int remaining = countdownSeconds - elapsed;

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
                    onPressed: null,
                    child: Text("Sabotuj światła"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Sabotuj kotłownię"),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
