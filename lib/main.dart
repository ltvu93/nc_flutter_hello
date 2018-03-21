import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  int dataSet = 50;

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0, 100.0),
          painter: new BarChartPainter(dataSet.toDouble()),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter(this.barHeight);

  final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      new Rect.fromLTWH(
        (size.width - barWidth) / 2.0,
        size.height - barHeight,
        barWidth,
        barHeight,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}