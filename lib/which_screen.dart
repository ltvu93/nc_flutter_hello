import 'package:flutter/material.dart';

class WhichScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WhichStateScreen();
  }
}

class WhichStateScreen extends State<WhichScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: new Color(0xffee613a),
        accentColor: new Color(0xffe04d25),
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('WHICH?'),
          centerTitle: true,
          leading: new IconButton(
              icon: new Image.asset('images/back_icon.png'), onPressed: () {
                Navigator.pop(context);
          }),
        ),
        body: new ListView(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
