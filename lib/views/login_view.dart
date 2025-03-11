import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/notifiers/player_notifier.dart';
import 'package:kj_amongus/services/providers/auth_service_provider.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:kj_amongus/views/register_view.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerService = ref.watch(playerServiceProvider);
    final authService = ref.watch(authServiceProvider);

    final nicknameController = useTextEditingController();
    final passwordController = useTextEditingController();

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
                onPressed: () => ref.read(playerProvider.notifier).login(
                    nicknameController.text, passwordController.text, ref),
                label: Text("Zaloguj"),
                icon: Icon(Icons.login)),
          ],
        ),
      ),
    );
  }
}
