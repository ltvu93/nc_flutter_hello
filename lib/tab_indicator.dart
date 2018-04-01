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

class _TabIndicatorState extends State<TabIndicator>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> opacity;
  Animation<double> dxTargetAnim;
  Animation<double> dxEntryAnim;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: new Duration(milliseconds: 2000),
      vsync: this,
    );
    opacity = new Tween<double>(begin: 0.2, end: 1.0)
        .animate(intervalCurved(0.0, 1.0, Curves.bounceIn));
    dxTargetAnim = new Tween<double>(begin: 50.0, end: 200.0)
        .animate(intervalCurved(0.0, 1.0));
    dxEntryAnim = new Tween<double>(begin: 50.0, end: 200.0)
        .animate(intervalCurved(0.5, 1.0));

    animationController
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
          painter: new _TabIndicationPainter(
            dxTarget: dxTargetAnim.value,
            dxEntry: dxEntryAnim.value,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.refresh),
        onPressed: null,
      ),
    );
  }

  CurvedAnimation intervalCurved(begin, end, [curve = Curves.easeInOut]) {
    return new CurvedAnimation(
      parent: animationController,
      curve: new Interval(begin, end, curve: curve),
    );
  }
}

class _TabIndicationPainter extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  _TabIndicationPainter(
      {this.dxTarget = 200.0,
      this.dxEntry = 50.0,
      this.radius = 50.0,
      this.dy = 50.0}) {
    painter = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset entry = new Offset(dxEntry, dy);
    Offset target = new Offset(dxTarget, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * PI, 1 * PI);
    path.addRect(new Rect.fromLTRB(entry.dx, 0.0, target.dx, 100.0));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * PI, 1 * PI);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(_TabIndicationPainter oldDelegate) => true;
}
