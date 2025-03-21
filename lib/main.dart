import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kj_amongus/firebase_options.dart';
import 'package:kj_amongus/views/admin_view.dart';
import 'package:kj_amongus/views/game_manager/game_manager_view.dart';
import 'package:kj_amongus/views/login_view.dart';
import 'package:kj_amongus/views/player/emergency_meeting/player_emergency_meeting_summary_view.dart';
import 'package:kj_amongus/views/player/emergency_meeting/player_emergency_meeting_view.dart';
import 'package:kj_amongus/views/player/player_impostor_view.dart';
import 'package:kj_amongus/views/player/player_join_game_view.dart';
import 'package:kj_amongus/views/player/player_qr_view.dart';
import 'package:kj_amongus/views/player/player_view.dart';
import 'package:kj_amongus/views/player/player_view_manager.dart';
import 'package:kj_amongus/views/player_test_view.dart';
import 'package:kj_amongus/views/player/player_game_view.dart';
import 'package:kj_amongus/views/test/test_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      //   textTheme: GoogleFonts.amaticScTextTheme(),
      // ),
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'The Godfather',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        //fontFamily: 'The Godfather',
        fontFamily: GoogleFonts.lora().fontFamily,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 7, 7),
            brightness: Brightness.dark),
      ).copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'The Godfather', fontSize: 30, color: Colors.white),
        ),
      ),
      // darkTheme: ThemeData(
      //     //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     brightness: Brightness.dark,
      //     useMaterial3: true,
      //     textTheme: GoogleFonts.amaticScTextTheme()
      //         .apply(bodyColor: Colors.white)
      //         .copyWith(
      //           bodyLarge: GoogleFonts.amaticSc(
      //               fontSize: 28,
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold),
      //           bodyMedium: GoogleFonts.amaticSc(
      //               fontSize: 24,
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold),
      //           bodySmall: GoogleFonts.amaticSc(
      //               fontSize: 20,
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold),
      //           titleLarge: GoogleFonts.amaticSc(
      //               fontSize: 36,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white),
      //         )),
      //home: PlayerTestView(),
      // home: GameView(),
      //home: PlayerView(),
      //home: PlayerJoinGameView(),
      //home: PlayerViewManager(),
      //home: PlayerQrView(),
      // home: MyHomePage(title: "Title"),
      // home: PlayerImpostorView(),
      // home: PlayerEmergencyMeetingSummaryView(),
      home: LoginView(),
      // home: PlayerView(),
      // home: AdminView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
