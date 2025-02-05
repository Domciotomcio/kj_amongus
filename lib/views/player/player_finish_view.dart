import 'package:flutter/material.dart';

class PlayerFinishView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Finish View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Player Finish View',
            ),
          ],
        ),
      ),
    );
  }
}
