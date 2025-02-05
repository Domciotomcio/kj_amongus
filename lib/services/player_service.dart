import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/constants/const.dart';
import 'package:kj_amongus/constants/task_templates.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/data/models/task/task.dart';
import 'package:kj_amongus/data/models/task/task_template.dart';
import 'package:kj_amongus/services/game_service.dart';
import 'package:uuid/uuid.dart';

class PlayerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPlayer(
      String nickname, String name, String fraction) async {
    final id = Uuid().v4();

    final player = Player(
        id: id,
        nickname: "adam213",
        name: "adam",
        tasks: [],
        isAlive: true,
        fraction: null);

    await _firestore.collection('players').doc(id).set(player.toJson());
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

  Future<void> removeAllPlayers() async {
    final players = await _firestore.collection('players').get();
    for (final player in players.docs) {
      await player.reference.delete();
    }
  }

  Future<void> addTasksToPlayers() async {
    final players = await _firestore.collection('players').get();
    for (final player in players.docs) {
      final shuffledTemplates = List<TaskTemplate>.from(taskTemplates)
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

  Future<void> killPlayer(String playerId) async {
    await _firestore.collection('players').doc(playerId).update({
      'isAlive': false,
    });
  }

  Future<void> reportBody(String playerId) async {
    final GameService gameService = GameService();
    await gameService.startEmergencyMeeting();
  }

  Future<void> completeTask(String playerId, String taskId) async {
    final player = await _firestore.collection('players').doc(playerId).get();
    final tasks = player.data()!['tasks'] as List<dynamic>;
    final taskIndex = tasks.indexWhere((task) => task['id'] == taskId);
    tasks[taskIndex]['isDone'] = true;

    await _firestore.collection('players').doc(playerId).update({
      'tasks': tasks,
    });
  }
}
