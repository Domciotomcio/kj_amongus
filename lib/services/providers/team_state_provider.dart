import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/team/team.dart';
import 'package:kj_amongus/services/notifiers/player_state_notifier.dart';
import 'package:kj_amongus/services/providers/team_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_state_provider.g.dart';

@riverpod
Stream<Team> teamState(Ref ref) {
  final playerState = ref.watch(playerStateNotifierProvider.notifier).state;
  final teamService = ref.watch(teamServiceProvider);
  return teamService.streamTeam(playerState!.teamId!);
}
