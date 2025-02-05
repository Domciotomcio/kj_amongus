import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/game/game.dart';

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
}
