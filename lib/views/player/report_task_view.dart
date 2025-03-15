import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:kj_amongus/services/providers/player_state_provider.dart';
import 'package:kj_amongus/services/providers/team_service_provider.dart';

class ReportTaskView extends HookConsumerWidget {
  const ReportTaskView({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskCodeController = useTextEditingController();

    final TeamService teamService = ref.watch(teamServiceProvider);
    final playerState = ref.watch(playerStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zgłoś zadanie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wpisz numer zadania i kliknij przycisk "Zgłoś zadanie"'),
            SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Numer zadania',
              ),
              controller: taskCodeController,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final player = playerState.value;
                if (player != null) {
                  final success = await teamService.toggleTask(
                      player.teamId!, taskCodeController.text);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Zadanie zostało zgłoszone'),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nie udało się zgłosić zadania'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              icon: const Icon(Icons.check),
              label: const Text('Zgłoś zadanie'),
            ),
          ],
        ),
      ),
    );
  }
}
