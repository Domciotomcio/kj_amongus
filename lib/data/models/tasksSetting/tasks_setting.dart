import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_setting.freezed.dart';
part 'tasks_setting.g.dart';

@freezed
class TasksSetting with _$TasksSetting {
  const factory TasksSetting({
    required String id,
    required int tasksShortNumber,
    required int tasksLongNumber,
    required int tasksCommonNumber,
  }) = _TasksSetting;

  factory TasksSetting.fromJson(Map<String, dynamic> json) =>
      _$TasksSettingFromJson(json);
}
