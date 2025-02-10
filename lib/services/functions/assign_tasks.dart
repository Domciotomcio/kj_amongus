import 'package:kj_amongus/constants/task_templates.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/data/models/task/task.dart';
import 'package:kj_amongus/services/player_service.dart';


Future<bool> assignTasks() async {
  final PlayerService playerService = PlayerService();

  // get number of players
  List<Player> players = await playerService.getPlayers();

  // assign tasks to players
  // one player has one long task, one common task and two short tasks
  players.shuffle();

  for (int i = 0; i < players.length; i++) {
    // get random long task from taskTemplatesLong
    final randomTaskLong = taskTemplatesLong[i % taskTemplatesLong.length];
    final taskLong = Task.fromTemplate(randomTaskLong);
    // assign long task
    players[i] = players[i].copyWith(tasks: players[i].tasks..add(taskLong));

    // get random common task from taskTemplatesCommon
    final randomTaskCommon =
        taskTemplatesCommon[i % taskTemplatesCommon.length];
    final taskCommon = Task.fromTemplate(randomTaskCommon);
    // assign common task
    players[i] = players[i].copyWith(tasks: players[i].tasks..add(taskCommon));

    // get random short tasks from taskTemplatesShort
    final randomTaskShort1 =
        taskTemplatesShort[(i * 2) % taskTemplatesShort.length];
    final taskShort1 = Task.fromTemplate(randomTaskShort1);
    final randomTaskShort2 =
        taskTemplatesShort[(i * 2 + 1) % taskTemplatesShort.length];
    final taskShort2 = Task.fromTemplate(randomTaskShort2);
    // assign short tasks
    players[i] = players[i].copyWith(
        tasks: players[i].tasks
          ..add(taskShort1)
          ..add(taskShort2));

    // update player
    await playerService.updatePlayer(players[i]);
  }

  return true;
}
