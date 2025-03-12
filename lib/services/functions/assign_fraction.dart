import 'package:kj_amongus/data/models/fraction/fraction.dart';
import 'package:kj_amongus/data/models/player/player.dart';
import 'package:kj_amongus/services/firestore/player_service.dart';
import 'package:kj_amongus/services/player_setting_service.dart';

Future<bool> assignFraction() async {
  final PlayerService playerService = PlayerService();
  final PlayerSettingService playerSettingService = PlayerSettingService();

  // get number of players
  List<Player> players = await playerService.getPlayers();
  final playersNumber = players.length;
  print("Dotarłem tutja");

  // get number of green, blue and red
  final playersSetting = await playerSettingService.getPlayersSetting();
  final greenNumber = playersSetting.greenNumber;
  final blueNumber = playersSetting.blueNumber;
  final redNumber = playersSetting.redNumber;

  // check if the number is equal
  if (playersNumber != greenNumber + blueNumber + redNumber) {
    print("Zwracam false");
    return false;
  }

  print("Tutaj tez");

  // assign fraction to players
  players.shuffle();
  for (int i = 0; i < playersNumber; i++) {
    if (i < greenNumber) {
      players[i] = players[i].copyWith(fraction: Fraction.green);
    } else if (i < greenNumber + blueNumber) {
      players[i] = players[i].copyWith(fraction: Fraction.blue);
    } else {
      players[i] = players[i].copyWith(fraction: Fraction.red);
    }
    print("Przed update player");
    await playerService.updatePlayer(players[i]);
    print("Po update player");
  }
  return true;
}
