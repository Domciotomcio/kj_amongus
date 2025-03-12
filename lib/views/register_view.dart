import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/auth_service.dart';
import 'package:kj_amongus/services/providers/auth_service_provider.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthService authService = ref.read(authServiceProvider);

    final nicknameController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();

    final isLoading = useState(false);

    Future<void> registerUser() async {
      isLoading.value = true;

      final player = Player(
        id: nicknameController.text,
        nickname: nicknameController.text,
        name: nameController.text,
        password: passwordController.text,
      );

      log(player.toString());

      final sucess = await authService.register(player);

      if (!context.mounted) {
        return; // Ensure the widget is still mounted before using `context`
      }
      if (sucess == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Zarejestrowano pomyślnie'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Nie udało się zarejestrować'),
            backgroundColor: Colors.red,
          ),
        );
      }

      isLoading.value = false;

      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Rejestracja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nick w grze',
              ),
              controller: nicknameController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Imię',
              ),
              controller: nameController,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Hasło',
              ),
              controller: passwordController,
            ),
            SizedBox(height: 20),
            Divider(),
            FilledButton.icon(
                onPressed: isLoading.value ? null : registerUser,
                label: Text("Zarejestruj"),
                icon: Icon(Icons.login)),
          ],
        ),
      ),
    );
  }
}
