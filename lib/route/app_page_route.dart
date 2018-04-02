import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AppPageRoute extends MaterialPageRoute<Null> {
  AppPageRoute(
      {WidgetBuilder builder, RouteSettings settings: const RouteSettings()})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
