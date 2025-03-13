import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_service_provider.g.dart';

@riverpod
TeamService teamService(Ref ref) {
  return TeamService();
}