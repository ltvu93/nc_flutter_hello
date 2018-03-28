import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SHOP'),
        centerTitle: true,
        leading: new IconButton(
            icon: new Image.asset('images/menu_icon.png'),
            tooltip: 'Air it',
            onPressed: null),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null),
          new IconButton(
              icon: new Icon(Icons.notifications_active), onPressed: null),
        ],
      ),
      body: new Center(
        child: new Text('Hello'),
      ),
    );
  }
}
