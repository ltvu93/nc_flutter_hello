import 'dart:math';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'home_screen.dart';
import 'which_screen.dart';
import 'how_screen.dart';
import 'display_anim.dart';
import 'searchbar_anim.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: new Color(0xffee613a),
        accentColor: new Color(0xffe04d25),
      ),
      home: new MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Container(
              height: 100.0,
              color: Colors.yellow,
            ),
            new DisplayAnimWidget(),
            new SearchBarAnimWidget(),
            new Container(
              height: 100.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
