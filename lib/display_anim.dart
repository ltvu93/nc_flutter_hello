import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class DisplayAnimWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DisplayAnimState();
  }
}

class DisplayAnimState extends State<DisplayAnimWidget> with TickerProviderStateMixin {
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
                width: 100.0,
                height: 100.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      width: 100.0,
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
