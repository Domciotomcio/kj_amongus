import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/functions/handle_firestore_error.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';

class AuthService {
  final PlayerService playerService;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference<Player> get playersCollection =>
      firestore.collection('players').withConverter(
          fromFirestore: (snapshot, _) => Player.fromJson(snapshot.data()!),
          toFirestore: (player, _) => player.toJson());

  AuthService({required this.playerService});

  Future<Player?> login(String nickname, String password) async {
    return handleFirestoreError<Player>("signing in", () async {
      // check if player exists
      final player = await playerService.getPlayerByNickname(nickname);

      // check player password
      if (player != null && player.password == password) {
        return player;
      }

      // if player does not exist or password is incorrect
      return null;
    });
  }

  Future<bool?> register(Player player) async {
    return handleFirestoreError<bool>("registering", () async {
      final querySnapshot = await playerService.getPlayerByNickname(player.nickname);

      if (querySnapshot != null) {
        return false;
      }

      await playersCollection.doc(player.id).set(player);
      return true;
    });
  }
}
