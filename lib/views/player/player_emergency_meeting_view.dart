import 'package:flutter/material.dart';

class PlayerEmergencyMeetingView extends StatelessWidget {
  const PlayerEmergencyMeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Meeting'),
      ),
      body: const Center(
        child: Text('Emergency Meeting'),
      ),
    );
  }
}
