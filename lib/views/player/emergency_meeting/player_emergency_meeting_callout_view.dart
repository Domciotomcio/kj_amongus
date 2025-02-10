import 'package:flutter/material.dart';

class PlayerEmergencyMeetingCalloutView extends StatelessWidget {
  const PlayerEmergencyMeetingCalloutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Meeting'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Zwołano spotkanie'),
            Text("Jak najszybciej udaj się do cafeterii"),
          ],
        ),
      ),
    );
  }
}