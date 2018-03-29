import 'package:flutter/material.dart';

class RequestIndicatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RequestIndicatorStateWidget();
  }
}

class RequestIndicatorStateWidget extends State<RequestIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: const Color(0xffee613a),
      padding: const EdgeInsets.symmetric(horizontal: 10.3, vertical: 10.0),
      child: new Row(
        children: <Widget>[
          new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Container(
                width: 47.0,
                height: 47.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              new Image.asset('images/which_icon_1.png'),
            ],
          ),
          new Image.asset(
            'images/indicator_connect.png',
            width: 52.0,
            height: 0.7,
            fit: BoxFit.fitHeight,
          ),
          new Image.asset(
            'images/how_icon_2.png',
            width: 47.0,
            height: 47.0,
          ),
          new Image.asset(
            'images/indicator_connect.png',
            width: 52.0,
            height: 0.7,
            fit: BoxFit.fitHeight,
          ),
          new Image.asset(
            'images/where_icon_2.png',
            width: 47.0,
            height: 47.0,
          ),
          new Image.asset(
            'images/indicator_connect.png',
            width: 52.0,
            height: 0.7,
            fit: BoxFit.fitHeight,
          ),
          new Image.asset(
            'images/when_icon_2.png',
            width: 47.0,
            height: 47.0,
          ),
        ],
      ),
    );
  }
}
