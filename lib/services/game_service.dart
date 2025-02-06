import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/task/task.dart';

class GameService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get game with id 1
  Stream<Game> getGameStream() {
    return _firestore.collection('games').doc('1').snapshots().map((snapshot) {
      print(snapshot.data());
      return Game.fromJson(snapshot.data()!);
    });
  }

  Future<bool> startGame() async {
    try {
      await _firestore.collection('games').doc('1').update({'isStarted': true});
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> startEmergencyMeeting() async {
    await _firestore.collection('games').doc('1').update({
      'isEmergencyMeeting': true,
      'emergencyMeetingStartedAt': DateTime.now()
    });
  }

  Future<void> endEmergencyMeeting() async {
    await _firestore.collection('games').doc('1').update(
        {'isEmergencyMeeting': false, 'emergencyMeetingStartedAt': null});
  }

  Future<bool> isGameStarted() async {
    final game = await _firestore.collection('games').doc('1').get();
    return game.data()!['isStarted'];
  }

  Future<void> recalculateTasks() async {
    // go through all players and recalculate completedTasksNumber
    final players = await _firestore.collection('players').get();
    final List<Task> allTasks = [];
    for (final player in players.docs) {
      final tasks = player.data()['tasks'] as List;
      allTasks.addAll(tasks.map((task) => Task.fromJson(task)));
    }

    final allTasksNumber = allTasks.length;
    final completedTasksNumber = allTasks.where((task) => task.isDone).length;

    await _firestore.collection('games').doc('1').update({
      'allTasksNumber': allTasksNumber,
      'completedTasksNumber': completedTasksNumber
    });
  }

  Future<void> assignFractions() async {
    // remove fractions from all players
    final players = await _firestore.collection('players').get();
    for (final player in players.docs) {
      await player.reference.update({'fraction': null});
    }

    // get all players
    final playersList = players.docs.map((player) => player.data()).toList();

    final playersListLength = playersList.length;

    final blueGuysNumber = playersListLength ~/ 3;
  }
}
