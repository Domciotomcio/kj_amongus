// import 'package:flutter/material.dart';
// import 'package:kj_amongus/data/models/player/player.dart';
// import 'package:kj_amongus/services/player_service.dart';

// class PlayerEmergencyMeetingSummaryView extends StatelessWidget {
//   PlayerEmergencyMeetingSummaryView({super.key});

//   final PlayerService playerService = PlayerService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Emergency Meeting - Wynik głosowania'),
//         ),
//         body: StreamBuilder(
//             stream: playerService.getPlayersStream(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }

//               final players = snapshot.data as List<Player>;

//               return Column(
//                 children: [
//                   const Text("Wynik głosowania:"),
//                   Expanded(
//                       child: ListView.separated(
//                     itemCount: players.length,
//                     separatorBuilder: (context, index) => const Divider(),
//                     itemBuilder: (context, index) {
//                       final player = players[index];
//                       return ListTile(
//                         title: player.isAlive
//                             ? Text(player.nickname)
//                             : Text(player.nickname,
//                                 style: const TextStyle(
//                                     decoration: TextDecoration.lineThrough)),
//                         subtitle: Text("Liczba głosów: ${player.votesNumber}"),
//                       );
//                     },
//                   )),
//                 ],
//               );
//             }));
//   }
// }
