import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/game/game.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
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

  Future<bool> isGameStarted() async {
    final game = await _firestore.collection('games').doc('1').get();
    return game.data()!['state'] != 'lobby';
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

  Future<void> changeGameState(GameState state) async {
    // emergency meeting
    if (state == GameState.emergencyMeeting) {
      // reset votes for player
      final players = await _firestore.collection('players').get();
      for (final player in players.docs) {
        await player.reference.update({'votesNumber': 0});
      }

      await _firestore.collection('games').doc('1').update({'state': state});
      return;
    }

    // emergency meeting summary
    if (state == GameState.emergencyMeetingSummary) {
      // find player with most votes
      final mostVotedPlayer = await _firestore
          .collection('players')
          .orderBy('votesNumber')
          .limitToLast(1)
          .get()
          .then((snapshot) => snapshot.docs.first);

      // kill player
      await mostVotedPlayer.reference.update({'isAlive': false});

      await _firestore.collection('games').doc('1').update({'state': state});
      return;
    }
  }

  Future<void> clearGame() async {
    // TODO FIX
    await _firestore.collection('games').doc('1').update({
      'isStarted': false,
      'state': 'lobby',
      'allTasksNumber': 0,
      'completedTasksNumber': 0,
    });
  }

  Future<void> gameOver(Fraction winnerFraction) async {
    await _firestore.collection('games').doc('1').update({
      'state': 'gameOver',
      'winnerFraction': winnerFraction.toString().split('.').last,
    });
  }
}
