import 'package:flutter/material.dart';
import 'package:flutter_challenge/home/titles.dart';
import 'bottomAppBar.dart';
import 'category_selector.dart';
import 'grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          TitlePage(),
          CategorySelector(),
          Needs(),
          BottomNavBar(),
        ],
      ),
    );
  }
}
