
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("DemoApp")),
      body: null,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
