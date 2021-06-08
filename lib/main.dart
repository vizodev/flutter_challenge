// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Domain/MainStore.dart';
import 'screens/ExpertsList.dart';
import 'screens/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(VisoChallenge());
}

class VisoChallenge extends StatefulWidget {
  _VisoChallengeState createState() => _VisoChallengeState();
}

class _VisoChallengeState extends State<VisoChallenge> {
  Widget build(BuildContext context) {
    return ListenableProvider<MainStore>(
      create: (_) => MainStore(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/home",
          routes: {
            "/home": (_) => Home(),
            "/expertsList": (_) => ExpertsList()
          }),
    );
  }
}
