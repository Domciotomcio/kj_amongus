import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PlayerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPlayer(
      String nickname, String name, String fraction) async {
    final id = Uuid().v4();

    await _firestore.collection('players').doc(id).set({
      'nickname': nickname,
      'name': name,
      'fraction': fraction,
    });
  }
}
