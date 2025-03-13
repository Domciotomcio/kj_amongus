import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/data/models/team/team.dart';
import 'package:kj_amongus/services/providers/team_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_state_provider.g.dart';

@riverpod
Stream<Team> teamState(Ref ref) {
  final teamId = "1";
  final teamService = ref.watch(teamServiceProvider);
  return teamService.streamTeam(teamId);
}
