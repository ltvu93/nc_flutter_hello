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
  int dataSet;

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Data set: $dataSet'),
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
