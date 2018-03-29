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
              icon: new Image.asset('images/search_icon.png'), onPressed: null),
          new IconButton(
              icon: new Image.asset('images/notify_icon.png'), onPressed: null),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          searchWidget,
          requestWidget,
          adWidget,
          productFilter
        ],
      ),
    );
  }

  Widget searchWidget = new Container(
    height: 61.75,
    color: const Color(0xffee613a),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(const Radius.circular(2.7)),
      ),
      margin:
          const EdgeInsets.only(left: 9.7, right: 9.7, top: 8.4, bottom: 16.7),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Image.asset('images/search_bar_icon.png'),
              onPressed: null),
          new Flexible(
            //new
            child: new TextField(
              controller: new TextEditingController(),
              onSubmitted: null,
              decoration: new InputDecoration.collapsed(
                  hintText: "Browse or past your product link from web"),
            ),
          ),
          new IconButton(
            icon: new Image.asset('images/search_bar_qr.png'),
            onPressed: null,
          )
        ],
      ),
    ),
  );

  Widget requestWidget = new Container(
    color: const Color(0xffe04d25),
    child: new Column(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(top: 13.0, left: 9.7, right: 9.7),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Text('Create request',
                      style: new TextStyle(fontSize: 12.0))),
              new Expanded(
                  child: new Text('Traveller’s Recommendations',
                      style: new TextStyle(fontSize: 12.0)))
            ],
          ),
        ),
        new Container(
          height: 188.3,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: new List.generate(10, (int index) {
              return new Image.asset(
                'images/item_bg.png',
              );
            }),
          ),
        ),
        new Container(
          height: 10.0,
        )
      ],
    ),
  );

  Widget adWidget = new Container(
    child: new Image.asset('images/banner.png'),
  );

  Widget productFilter = new Container(
    height: 308.4,
    padding: const EdgeInsets.only(top: 28.0),
    color: const Color(0xffe5e5e5),
    child: new Column(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(left: 9.7, right: 9.7),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Text('Category Recommendation',
                      style: new TextStyle(fontSize: 13.9))),
              new Text(
                'Show more',
                style: new TextStyle(
                    fontSize: 12.7, color: const Color(0xff95959e)),
              )
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(
              left: 9.7, right: 9.7, top: 14.7, bottom: 9.7),
          decoration: new BoxDecoration(
            color: const Color(0xffd0d0d0),
            borderRadius: const BorderRadius.all(const Radius.circular(2.7)),
          ),
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(
                    left: 12.7, top: 12.7, bottom: 10.0, right: 14.7),
                child: new Image.asset('images/computer_icon.png'),
              ),
              new Expanded(
                child: new Text('Electronics & Computers'),
              ),
              new Container(
                padding: const EdgeInsets.only(
                    left: 12.7, right: 14.9),
                child: new Image.asset('images/more_icon.png'),
              ),
            ],
          ),
        ),
        new Container(
          height: 189.3,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: new List.generate(10, (int index) {
              return new Image.asset(
                'images/item_bg.png',
              );
            }),
          ),
        ),
        new Container(
          height: 10.0,
        )
      ],
    ),
  );
}
