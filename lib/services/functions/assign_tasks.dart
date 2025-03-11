import 'package:kj_amongus/constants/task_templates.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/data/models/task/task.dart';
import 'package:kj_amongus/services/player_service.dart';

Future<bool> assignTasks() async {
  final PlayerService playerService = PlayerService();

  // get number of players
  List<Player> players = await playerService.getPlayers();

  print("Dotarłem tutja 2");

  // assign tasks to players
  // one player has one long task, one common task and two short tasks
  players.shuffle();

  print("Dotarłem tutja 3");

  for (int i = 0; i < players.length; i++) {
    // get random long task from taskTemplatesLong
    final randomTaskLong = taskTemplatesLong[i % taskTemplatesLong.length];
    final taskLong = Task.fromTemplate(randomTaskLong);

    List<Task> newTasks = [];
    if (players[i].tasks == null) {
      List<Task> newTasks = [];
    } else {
      List<Task> newTasks = List.from(players[i].tasks!);
    }

    // assign long task
    newTasks.add(taskLong);

    // get random common task from taskTemplatesCommon
    final randomTaskCommon =
        taskTemplatesCommon[i % taskTemplatesCommon.length];
    final taskCommon = Task.fromTemplate(randomTaskCommon);
    // assign common task
    newTasks.add(taskCommon);

    print("Dotarłem tutja 5");

    // get random short tasks from taskTemplatesShort
    final randomTaskShort1 =
        taskTemplatesShort[(i * 2) % taskTemplatesShort.length];
    final taskShort1 = Task.fromTemplate(randomTaskShort1);
    final randomTaskShort2 =
        taskTemplatesShort[(i * 2 + 1) % taskTemplatesShort.length];
    final taskShort2 = Task.fromTemplate(randomTaskShort2);
    // assign short tasks
    newTasks.add(taskShort1);
    newTasks.add(taskShort2);

    // players[i] = players[i].copyWith(tasks: newTasks);

    // update player
    print("Before update");
    print(players[i]);
    if (players[i].fraction == Fraction.red) {
      continue;
    }
    await playerService.updatePlayerTasks(players[i].id, newTasks);
    print("After update");
  }

  return true;
}
