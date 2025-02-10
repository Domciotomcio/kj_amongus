import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kj_amongus/data/models/task/task_template.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    required String description,
    required bool isDone,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  const Task._();

  factory Task.fromTemplate(TaskTemplate template) {
    return Task(
      id: template.id,
      name: template.name,
      description: template.description,
      isDone: false,
    );
  }
}
