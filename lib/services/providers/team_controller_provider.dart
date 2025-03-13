import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/controllers/team_controller.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';
import 'package:kj_amongus/services/providers/player_service_provider.dart';
import 'package:kj_amongus/services/providers/team_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_controller_provider.g.dart';

@riverpod
TeamController teamController(Ref ref) {
  final TeamService teamService = ref.watch(teamServiceProvider);
  final PlayerService playerService = ref.watch(playerServiceProvider);
  return TeamController(teamService, playerService);
}
