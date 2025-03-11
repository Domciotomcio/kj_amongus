import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/constants/const.dart';
import 'package:kj_amongus/constants/task_templates.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/data/models/task/task.dart';
import 'package:kj_amongus/data/models/task/task_template.dart';
import 'package:kj_amongus/services/functions/handle_firestore_error.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:uuid/uuid.dart';

class PlayerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference<Player> get playersCollection =>
      _firestore.collection('players').withConverter(
            fromFirestore: (snapshot, _) => Player.fromJson(snapshot.data()!),
            toFirestore: (player, _) => player.toJson(),
          );

  Future<Player?> getPlayer(String id) async {
    return handleFirestoreError<Player?>("fetching player", () async {
      final docSnapshot = await playersCollection.doc(id).get();

      return docSnapshot.exists ? docSnapshot.data() : null;
    });
  }

  Future<Player?> getPlayerByNickname(String nickname) async {
    return handleFirestoreError<Player?>("fetching player by nickname",
        () async {
      final querySnapshot = await playersCollection
          .where('nickname', isEqualTo: nickname)
          .limit(1)
          .get();

      return querySnapshot.docs.isNotEmpty
          ? querySnapshot.docs.first.data()
          : null;
    });
  }

  // manage players section
  Future<bool> createPlayer(Player p) async {
    return await handleFirestoreError<bool>("creating player", () async {
          final querySnapshot = await getPlayerByNickname(p.nickname);

          if (querySnapshot != null) {
            return false;
          }

          await playersCollection.doc(p.id).set(p);
          return true;
        }) ??
        false;
  }

  Stream<Player> streamPlayer(String id) {
    return playersCollection.doc(id).snapshots().map((snapshot) {
      return snapshot.data()!;
    });
  }

  Stream<Player> getPlayerStream(String id) {
    return _firestore.collection('players').doc(id).snapshots().map((snapshot) {
      return Player.fromJson(snapshot.data()!);
    });
  }

  Stream<List<Player>> getPlayersStream() {
    return _firestore.collection('players').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Player.fromJson(doc.data());
      }).toList();
    });
  }

  Future<List<Player>> getPlayers() async {
    final players = await _firestore.collection('players').get();
    return players.docs.map((doc) {
      return Player.fromJson(doc.data());
    }).toList();
  }

  Future<bool> updatePlayer(Player player) async {
    print(player.toJson());

    await _firestore
        .collection('players')
        .doc(player.id)
        .update(player.toJson());
    return true;
  }

  Future<bool> updatePlayerTasks(String playerId, List<Task> tasks) async {
    await _firestore.collection('players').doc(playerId).update({
      'tasks': tasks.map((e) => e.toJson()).toList(),
    });
    return true;
  }

  Future<bool> removePlayers() async {
    final players = await _firestore.collection('players').get();
    for (final player in players.docs) {
      await player.reference.delete();
    }
    return true;
  }

  Future<bool> isPlayerExists(String nickname) async {
    final players = await _firestore.collection('players').get();
    return players.docs
        .any((player) => player.data()['nickname'] == nickname.toUpperCase());
  }

  Future<void> removeAllPlayers() async {
    final players = await _firestore.collection('players').get();
    for (final player in players.docs) {
      await player.reference.delete();
    }
  }

  Future<void> addTasksToPlayers() async {
    final players = await _firestore.collection('players').get();

    for (final player in players.docs) {
      if (player.data()['fraction'] == 'red') {
        continue;
      }

      final shuffledTemplates = List<TaskTemplate>.from(taskTemplatesLong)
        ..shuffle();
      final selectedTemplates =
          shuffledTemplates.take(tasksNumberForPlayer).toList();

      // get random 3 tasks from taskTemplates
      List<Task> tasks = selectedTemplates
          .map((e) => Task(
              id: Uuid().v4(),
              name: e.name,
              description: e.description,
              isDone: false))
          .toList();

      await player.reference.update({
        'tasks': FieldValue.arrayUnion(tasks.map((e) => e.toJson()).toList())
      });
    }
  }

  Future<void> killPlayer(String playerId, Player killingPlayer) async {
    await _firestore.collection('players').doc(killingPlayer.id).update({
      'lastKillTimestamp': DateTime.now(),
    });

    await _firestore.collection('players').doc(playerId).update({
      'isAlive': false,
    });
  }

  Future<void> reportBody(String playerId) async {
    final GameService gameService = GameService();
    await gameService.changeGameState(GameState.emergencyMeeting);
  }

  Future<void> completeTask(String playerId, String taskId) async {
    final player = await _firestore.collection('players').doc(playerId).get();
    final tasks = player.data()!['tasks'] as List<dynamic>;
    final taskIndex = tasks.indexWhere((task) => task['id'] == taskId);
    tasks[taskIndex]['isDone'] = true;

    await _firestore.collection('players').doc(playerId).update({
      'tasks': tasks,
    });

    // recalculate tasks for game
    final gameService = GameService();
    await gameService.recalculateTasks();
  }

  Future<void> voteForPlayer(String id) async {
    return _firestore.collection('players').doc(id).update({
      'votesNumber': FieldValue.increment(1),
    });
  }

  Future<bool> isMostVotedPlayer(String id) async {
    // find player with most votes
    return _firestore
        .collection('players')
        .orderBy('votesNumber')
        .limitToLast(1)
        .get()
        .then((snapshot) {
      final mostVotedPlayer = snapshot.docs.first;
      return mostVotedPlayer.id == id;
    });
  }

  Future<void> resetAllTasks() {
    return _firestore.collection('players').get().then((snapshot) {
      for (final player in snapshot.docs) {
        player.reference.update({
          'tasks': [],
        });
      }
    });
  }
}
