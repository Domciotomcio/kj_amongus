import 'package:flutter/material.dart';
import 'package:kj_amongus/data/models/player/player.dart';

class PlayerSabotageView extends StatelessWidget {
  const PlayerSabotageView({super.key, required this.player});
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awaria Silników'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Awaria silników!"),
            Text(
              'Szybko, przeprowadzono sabotaz silników!',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            Text("Trzeba to szybko naprawić!"),
            Divider(),
            PlayerSabotageCountdownTimer(startTime: DateTime.now()),
          ],
        ),
      ),
    );
  }
}

class PlayerSabotageCountdownTimer extends StatelessWidget {
  final DateTime startTime;
  final int countdown = 30;

  PlayerSabotageCountdownTimer({required this.startTime});

  Stream<int> _countdownStream() async* {
    while (true) {
      int elapsed = DateTime.now().difference(startTime).inSeconds;
      int remaining = countdown - elapsed;

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
              "Pozostało: $remaining s",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
