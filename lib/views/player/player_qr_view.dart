// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:kj_amongus/data/models/game_state/game_state.dart';
// import 'package:kj_amongus/data/models/player/player.dart';
// import 'package:kj_amongus/services/game_service.dart';
// import 'package:kj_amongus/services/player_service.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

// class PlayerQrView extends StatefulWidget {
//   final String nickname = "Domcio";
//   final Player player;

//   const PlayerQrView(
//       {super.key, required this.player, nickname}); // FIX To required

//   @override
//   State<PlayerQrView> createState() => _PlayerQrViewState();
// }

// class _PlayerQrViewState extends State<PlayerQrView> {
//   final PlayerService playerService = PlayerService();
//   final GameService gameService = GameService();
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Player Qr View'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Player Qr View'),
//             Expanded(
//                 child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated)),
//             // Expanded(
//             //   child: Center(
//             //     child: (result != null)
//             //         ? Text(
//             //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//             //         : Text('Scan a code'),
//             //   ),
//             // ),
//             Text("W razie problemów zgłoś się do mistrza gry"),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _onQRViewCreated(QRViewController controller) async {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       setState(() {
//         result = scanData;
//       });
//       print("Wykryto kod QR: ${scanData.code}");

//       // something went wrong when scanning
//       if (scanData.code == null) {
//         return;
//       }

//       final String code = scanData.code!;

//       //if (code.contains("PLAYER") && pl

//       if (code.contains("PLAYER")) {
//         // if scanned Player is dead, change game state to emergency meeting
//         Player? scannedPlayer = await playerService.getPlayer(code);

//         if (!scannedPlayer!.isAlive) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text("Gracz ${scannedPlayer.nickname} jest martwy"),
//           ));

//           gameService.changeGameState(GameState.emergencyMeeting);
//           print(
//               "Player $scannedPlayer is dead, change game state to emergency meeting");
//         }

//         // if is not dead, check if reported player is impostor, then kill
//         Player? reporter =
//             await playerService.getPlayerByNickname(widget.nickname);
//         if (reporter!.isImpostor()) {
//           playerService.killPlayer(scannedPlayer.id, reporter);
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text("Wyeliminowałeś gracza ${scannedPlayer.nickname}"),
//           ));

//           print("Player $reporter killed $scannedPlayer");
//         }

//         // if is not impostor, something might went wrong
//         print("Player $reporter tried to kill $scannedPlayer ???");

//         // check if player is dead, if impostor do action kill him, bla bla bla
//       } else if (code.contains("TASK")) {
//         print("Mark task $code as done");

//         // show snackbar with task name
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Zadanie zakończone"),
//         ));

//         // here also logic to mark task as done
//         playerService.completeTask(widget.player.id, code);
//       } else {
//         print("Unknown code $code");
//       }
//     });
//   }
// }
