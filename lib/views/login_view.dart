import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/notifiers/player_notifier.dart';
import 'package:kj_amongus/services/providers/auth_service_provider.dart';
import 'package:kj_amongus/views/player/player_view.dart';
import 'package:kj_amongus/views/register_view.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    final nicknameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isLoading = useState(false);

    Future<void> login() async {
      isLoading.value = true;

      final player = await authService.login(
          nicknameController.text, passwordController.text);

      log(player.toString());

      if (!context.mounted) {
        return; // Ensure the widget is still mounted before using `context`
      } else if (player == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Nie udało się zalogować'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // user logged in
        ref.read(playerStateProvider.notifier).loadPlayer(player);

        log(ref.watch(playerStateProvider).toString());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Zalogowano pomyślnie'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => PlayerView()),
            (route) => false);
      }

      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Ekran logowania'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RegisterView()));
          },
          label: Text("Zarejestruj się"),
          icon: Icon(Icons.person_add)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset('assets/images/face.png'),
            Text('Witaj w grze "Ojciec Chrzestny"'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nick w grze',
              ),
              controller: nicknameController,
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
            FilledButton.icon(
                onPressed: () => isLoading.value ? null : login(),
                label: Text("Zaloguj"),
                icon: Icon(Icons.login)),
          ],
        ),
      ),
    );
  }
}
