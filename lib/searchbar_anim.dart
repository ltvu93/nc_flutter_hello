import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SearchBarAnimWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchBarAnimState();
  }
}

class SearchBarAnimState extends State<SearchBarAnimWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> opacity;
  Animation<double> positionDown;
  Animation<double> positionUp;
  Animation<double> parentOffset;
  Animation<double> parentHeight;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 2000),
      vsync: this,
    );
    opacity = new Tween<double>(begin: 0.2, end: 1.0)
        .animate(intervalCurved(0.0, 1.0, Curves.easeInOut));
    positionDown = new Tween<double>(begin: -100.0, end: 50.0)
        .animate(intervalCurved(0.0, 0.25));
    positionUp = new Tween<double>(begin: 0.0, end: -50.0)
        .animate(intervalCurved(0.25, 0.75));
    parentOffset = new Tween<double>(begin: 0.0, end: 50.0)
        .animate(intervalCurved(0.0, 0.5));
    parentHeight = new Tween<double>(begin: 100.0, end: 50.0)
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
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Positioned(
            top: positionDown.value + positionUp.value,
            child: new Opacity(
              opacity: opacity.value,
              child: new Container(
                color: const Color(0xffee613a),
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  height: 36.7,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(const Radius.circular(2.7)),
                  ),
                  margin: new EdgeInsets.symmetric(
                      vertical: 10.3, horizontal: 9.7),
                  child: new Row(
                    children: <Widget>[
                      new IconButton(
                          icon: new Image.asset('images/search_bar_icon.png'),
                          onPressed: null),
                      new Flexible(
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
              ),
            ),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: parentHeight.value + parentOffset.value,
    );
  }

  CurvedAnimation intervalCurved(begin, end, [curve = Curves.ease]) {
    return new CurvedAnimation(
      parent: animationController,
      curve: new Interval(begin, end, curve: curve),
    );
  }
}
