import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/auth_service.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(Ref ref) {
  final playerService = ref.watch(playerServiceProvider);
  return AuthService(playerService: playerService);
}
