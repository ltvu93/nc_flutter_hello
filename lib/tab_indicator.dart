import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class TabIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TabIndicatorState();
  }
}

class _TabIndicatorState extends State<TabIndicator> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Test'),
      ),
      body: new Container(
        child: new CustomPaint(
          size: new Size(
            MediaQuery.of(context).size.width,
            100.0,
          ),
          painter: new _TabIndicationPainter(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.refresh),
        onPressed: null,
      ),
    );
  }
}

class _TabIndicationPainter extends CustomPainter {
  Paint painter;

  _TabIndicationPainter() {
    painter = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    double r = 50.0;
    double distance = 200.0;

    Path path = new Path();
    path.addArc(new Rect.fromCircle(
        center: new Offset(r, size.height / 2), radius: r),
      0.5 * PI,
      1 * PI);
    path.addRect(new Rect.fromLTWH(r, 0.0, distance, size.height));
    path.addArc(new Rect.fromCircle(
        center: new Offset(r + distance, size.height / 2), radius: r),
        1.5 * PI,
        1 * PI);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
