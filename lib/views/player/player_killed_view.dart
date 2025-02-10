import 'package:flutter/material.dart';

class PlayerKilledView extends StatelessWidget {
  const PlayerKilledView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gracz wyeliminowany'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Zostałeś wyeliminowany!',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            Text("Pozostań w miejscu, dopóki nie zgłosi cię inny gracz.")
          ],
        ),
      ),
    );
  }
}
