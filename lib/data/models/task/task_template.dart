import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_template.freezed.dart';
part 'task_template.g.dart';

@freezed
class TaskTemplate with _$TaskTemplate {
  const factory TaskTemplate({
    required String id,
    required String key,
    required String name,
    required String description,
  }) = _TaskTemplate;

  factory TaskTemplate.fromJson(Map<String, dynamic> json) =>
      _$TaskTemplateFromJson(json);
}
