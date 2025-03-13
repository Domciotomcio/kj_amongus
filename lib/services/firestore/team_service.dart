import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/task/task.dart';
import 'package:kj_amongus/data/models/team/team.dart';

class TeamService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference<Team> get teamsCollection =>
      firestore.collection('teams').withConverter(
          fromFirestore: (snapshot, _) => Team.fromJson(snapshot.data()!),
          toFirestore: (team, _) => team.toJson());

  Future<Team?> getTeamById(String id) async {
    final querySnapshot = await teamsCollection.doc(id).get();
    return querySnapshot.data();
  }

  Future<List<Team>> getTeams() async {
    final querySnapshot = await teamsCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<Team> streamTeam(String id) {
    log(id.toString());
    return teamsCollection.doc(id).snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Future<void> createTeam(Team team) async {
    await teamsCollection.doc(team.id).set(team);
  }

  Future<void> updateTeam(Team team) async {
    log('Updating team: ${team.toString()}');
    await FirebaseFirestore.instance.collection("teams").doc(team.id).set({
      "id": team.id,
      "name": team.name,
      "tasks": team.tasks
          .map((task) => task.toJson())
          .toList(), // ✅ Converts each Task to a Map
    });
  }

  Future<bool> deleteAllTeams() async {
    final querySnapshot = await teamsCollection.get();
    for (var doc in querySnapshot.docs) {
      doc.reference.delete();
    }
    return true;
  }

  Future<bool> assignTaskToTeam(String teamId, Task task) async {
    final team = await getTeamById(teamId);
    if (team == null) {
      return false;
    }
    team.tasks.add(task);
    await teamsCollection.doc(teamId).set(team);
    return true;
  }

  Future<bool> toggleTask(String teamId, String taskId) async {
    var team = await getTeamById(teamId);
    if (team == null) {
      return false;
    }
    try {
      var properTask = team.tasks.firstWhere((task) => task.id == taskId);

      properTask = properTask.toggleDone();

      team = team.copyWith(
        tasks: team.tasks
            .map((task) => task.id == taskId ? properTask : task)
            .toList(),
      );

      await updateTeam(team);
      return true;
    } catch (e) {
      return false;
    }
  }
}
