import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/data/models/playersSetting/players_setting.dart';

class PlayerSettingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<PlayersSetting> getPlayersSettingStream() {
    return _firestore
        .collection('games')
        .doc('players-setting')
        .snapshots()
        .map((snapshot) {
      return PlayersSetting.fromJson(snapshot.data()!);
    });
  }

  Future<void> setFractionNumber(Fraction fraction, int number) async {
    await _firestore.collection('games').doc('players-setting').update({
      fraction.name + 'Number': number,
    });
  }
}
