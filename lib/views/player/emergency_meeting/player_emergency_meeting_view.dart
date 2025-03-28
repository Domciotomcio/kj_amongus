// import 'package:flutter/material.dart';
// import 'package:kj_amongus/data/models/player/player.dart';
// import 'package:kj_amongus/services/player_service.dart';

// class PlayerEmergencyMeetingView extends StatefulWidget {
//   final Player player;

//   const PlayerEmergencyMeetingView({super.key, required this.player});

//   @override
//   State<PlayerEmergencyMeetingView> createState() =>
//       _PlayerEmergencyMeetingViewState();
// }

// class _PlayerEmergencyMeetingViewState
//     extends State<PlayerEmergencyMeetingView> {
//   final PlayerService playerService = PlayerService();
//   bool alreadyVoted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Emergency Meeting'),
//       ),
//       body: StreamBuilder(
//           stream: playerService.getPlayersStream(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }

//             final players = snapshot.data as List<Player>;

//             if (players
//                 .where((element) => element.isAlive)
//                 .every((element) => element.id != widget.player.id)) {
//               return Center(
//                   child: const Text("Nie żyjesz, nie możesz głosować"));
//             } else {
//               return Column(
//                 children: [
//                   const Text(
//                       "Rozpoczęło się spotkanie w cafeterii, szybko udaj się na głosowanie"),
//                   const Divider(),
//                   const Text("Zagłosuj na gracza:"),
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
//                         subtitle: Text("Liczba głosów"),
//                         trailing: player.isAlive && !alreadyVoted
//                             ? ElevatedButton(
//                                 onPressed: () {
//                                   playerService.voteForPlayer(player.id);
//                                   setState(() {
//                                     alreadyVoted = true;
//                                   });
//                                 },
//                                 child: const Text("Zabij"),
//                               )
//                             : null,
//                       );
//                     },
//                   )),
//                 ],
//               );
//             }
//           }),
//     );
//   }
// }
