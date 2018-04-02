import 'dart:math';
import 'dart:async';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'home_screen.dart';
import 'which_screen.dart';
import 'how_screen.dart';
import 'display_anim.dart';
import 'searchbar_anim.dart';
import 'tab_indicator.dart';
import 'app_page_route.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: new Color(0xffee613a),
        accentColor: new Color(0xffe04d25),
      ),
      home: new HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return new AppPageRoute(
              builder: (_) => new HomeScreen(),
              settings: settings,
            );
        }
        assert(false);
      },
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
      vsync: this,
      duration: new Duration(milliseconds: 3000),
    );
    animation = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animationController, curve: Curves.bounceIn),
    );
    animationController.forward();

    new Timer(new Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: demoAnim(),
    );
  }

  Widget demoAnim() {
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
            new RotationTransition(
              turns: animation,
              child: new Container(
                height: 100.0,
                width: 100.0,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
