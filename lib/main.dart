import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;
import 'home_screen.dart';

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

class MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  double size;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          size = lerpDouble(
              100, 400, animationController.value
          );
        });
      });
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: new Container(
        width: size,
        height: size,
        color: Colors.black,
      ),
    );
  }
}
