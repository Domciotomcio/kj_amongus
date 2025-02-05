import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:uuid/uuid.dart';

class PlayerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPlayer(
      String nickname, String name, String fraction) async {
    final id = Uuid().v4();

    await _firestore.collection('players').doc(id).set({
      'id': id,
      'nickname': nickname,
      'name': name,
      'fraction': fraction,
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
}
