import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/game_state/game_state.dart';

class GameStateService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference<GameState> get gameStateDoc =>
      firestore.doc('games/game_state').withConverter(
          fromFirestore: (snapshot, _) =>
              GameState.values.byName(snapshot.data()!['state']),
          toFirestore: (state, _) => {'state': state.index});

  Stream<GameState> streamGameState() async* {
    yield* gameStateDoc.snapshots().map((snapshot) => snapshot.data()!);
  }
}
