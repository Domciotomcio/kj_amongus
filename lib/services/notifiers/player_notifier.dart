import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/auth_service.dart';
import 'package:kj_amongus/services/player_service.dart';
import 'package:kj_amongus/services/providers/auth_service_provider.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@riverpod
class Player extends _$Player {
  @override
  Future<Player?> build() async {
    return null;
  }

  Future<void> login(String nickname, String password, WidgetRef ref) async {
    final authService = ref.read(authServiceProvider);
    final player = await authService.login(nickname, password);
    if (player == null) return;

    state = AsyncData<Player?>(player as Player);
  }
}
