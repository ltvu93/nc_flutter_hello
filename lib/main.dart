import 'package:flutter/material.dart';

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
            new IconButton(
                icon: new Image.asset('images/search_icon.png'),
                onPressed: null),
            new IconButton(
                icon: new Image.asset('images/notify_icon.png'),
                onPressed: null),
          ],
        ),
        body: new ListView(
          children: <Widget>[searchWidget, requestWidget, adWidget, productFilter],
        ));
  }

  Widget searchWidget = new Container(
    height: 61.75,
    color: const Color(0xffee613a),
    child: new Row(),
  );

  Widget requestWidget = new Container(
    height: 249.7,
    color: const Color(0xffe04d25),
    child: new Row(),
  );

  Widget adWidget = new Container(
    child:  new Image.asset('images/banner.png'),
  );

  Widget productFilter = new Container(
    height: 298.7,
    padding: const EdgeInsets.only(top: 28.0),
    color: const Color(0xffe5e5e5),
    child: new Row(),
  );
}
