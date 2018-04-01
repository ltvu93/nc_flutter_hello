import 'dart:math';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'home_screen.dart';
import 'which_screen.dart';
import 'how_screen.dart';
import 'display_anim.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: new Color(0xffee613a),
        accentColor: new Color(0xffe04d25),
      ),
      home: new WhichScreen(),
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
    return new Container(
      color: Colors.red,
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              width: 100.0,
              height: 100.0,
              color: Colors.yellow,
            ),
            new DisplayAnimWidget(),
            new Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
