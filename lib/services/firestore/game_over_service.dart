import 'package:cloud_firestore/cloud_firestore.dart';

class GameOverService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> get gameOverDoc =>
      _firestore.doc('games/game_over_data');

  Future<void> setWinner(String winner) async {
    await gameOverDoc.set({'winner': winner});
  }

  Future<String> getWinner() async {
    final docSnapshot = await gameOverDoc.get();
    return docSnapshot.data()!['winner'];
  }
}
