import 'dart:math';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'home_screen.dart';
import 'which_screen.dart';
import 'how_screen.dart';

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

class MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 1000),
      vsync: this,
    );
    final CurvedAnimation curve = new CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
    );
    Tween<double> tween = new Tween<double>(begin: 10.0, end: 100.0);

    animation = tween.animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener((state) {
      if(state == AnimationStatus.completed) {
        tween.begin = tween.evaluate(animation);
        tween.end = 0.0;
        animationController.reverse();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget _crossFade(double offset) {
    return new Container(
      margin: new EdgeInsets.only(top: offset),
      width: 100.0,
      height: 100.0,
      color: Colors.white,
    );
  }

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
            _crossFade(animation.value),
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
