import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kj_amongus/data/models/task/task.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    required List<Task> tasks,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  const Team._();

  Team addTask(Task task) {
    return copyWith(tasks: [...tasks, task]);
  }
}
