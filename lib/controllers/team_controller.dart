import 'package:kj_amongus/constants/tasks_templates_list.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/data/models/task/task.dart';
import 'package:kj_amongus/data/models/task/task_template.dart';
import 'package:kj_amongus/data/models/team/team.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/firestore/team_service.dart';

class TeamController {
  final TeamService _teamService;
  final PlayerService _playerService;

  TeamController(this._teamService, this._playerService);

  Future<bool> removeAllTeams() async {
    return await _teamService.deleteAllTeams();
  }

  Future<void> createTeams(int teamsCount) async {
    for (int i = 1; i <= teamsCount; i++) {
      await _teamService
          .createTeam(Team(id: i.toString(), name: "Zespół $i", tasks: []));
    }
  }

  Future<void> assignTeamsToPlayers() async {
    final List<Team> teams = await _teamService.getTeams();
    final List<Player> players = await _playerService.getPlayers();
    players.shuffle();
    for (int i = 0; i < players.length; i++) {
      players[i] = players[i].copyWith(teamId: teams[i % teams.length].id);
    }
    for (int i = 0; i < players.length; i++) {
      await _playerService.updatePlayer(players[i]);
    }
  }

  Future<void> assignTasks(int tasksNumber) async {
    final List<Team> teams = await _teamService.getTeams();

    // get random task from tasksTemplatesList
    final List<TaskTemplate> allTasksTemplates = List.from(tasksTemplatesList);

    for (int i = 0; i < teams.length; i++) {
      allTasksTemplates.shuffle();

      var team = teams[i];

      for (int j = 0; j < tasksNumber; j++) {
        final task = Task.fromTemplate(allTasksTemplates[j]);
        team = team.addTask(task);
      }
      await _teamService.updateTeam(team);
    }
  }
}
