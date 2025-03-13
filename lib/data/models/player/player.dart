import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/task/task.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String nickname,
    required String password,
    required String name,
    String? teamId,
    Fraction? fraction,
    List<Task>? tasks,
    bool? isAlive,
    int? votesNumber,
    @TimestampConverter() DateTime? lastKillTimestamp,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  const Player._();

  bool isAllTasksDone() {
    return tasks!.every((task) => task.isDone);
  }

  bool isImpostor() {
    return fraction == Fraction.red;
  }
}
