import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bar.dart';

void main() => runApp(new DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DemoScreenState();
  }
}

class DemoScreenState extends State<DemoScreen> with TickerProviderStateMixin {

  final random = new Random();
  AnimationController animation;
  BarTween tween;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = new BarTween(new Bar(0.0), new Bar(50.0));
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = new BarTween(
        tween.evaluate(animation),
        new Bar(100.0 * random.nextDouble()),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0, 100.0),
          painter: new BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}