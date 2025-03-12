import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportTaskView extends HookConsumerWidget {
  const ReportTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskCodeController = useTextEditingController();

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
              onPressed: () {},
              icon: const Icon(Icons.check),
              label: const Text('Zgłoś zadanie'),
            ),
          ],
        ),
      ),
    );
  }
}
