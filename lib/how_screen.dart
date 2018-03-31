import 'package:flutter/material.dart';
import 'request_indicator.dart';

class HowScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HowStateScreen();
  }
}

class HowStateScreen extends State<HowScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('HOW?'),
        centerTitle: true,
        leading: new IconButton(
            icon: new Image.asset('images/back_icon.png'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Column(
        children: <Widget>[
          new RequestIndicatorWidget(),
          new Container(
            height: 33.3,
            color: const Color(0xffe04d25),
            alignment: Alignment.center,
            child: new BottomUpWidget(
              child: new Text(
                "Choose your Service",
                style: new TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
          new BottomUpWidget(
            child: new Container(
              height: 78.0,
              color: const Color(0xffe4e5e4),
              child: new Container(
                height: 78.0,
                margin: const EdgeInsets.only(
                    left: 12.3, right: 98.7, top: 23.7, bottom: 27.0),
                child: new Text(
                  'Please choose what service you want to use to purchase and deliver your item',
                  style: new TextStyle(
                    color: const Color(0xff858585),
                  ),
                ),
              ),
            ),
          ),
          new BottomUpWidget(
            child: new Container(
              height: 166.7,
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(left: 25.3, right: 23.0),
                    child: new Image.asset('images/bargain_booking.png',
                        width: 60.3, height: 60.3),
                  ),
                  new Expanded(
                    child: new Container(
                      padding: const EdgeInsets.only(right: 21.3),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'Bargain Booking',
                              style: new TextStyle(
                                color: const Color(0xff757575),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          new Container(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              'With bargain bookintvg, traveller will offers with reasonable price which allow you to choose your best and trustest traveller.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(
                                color: const Color(0xff757575),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 10.0,
                  color: const Color(0xff1eb91e),
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 25.0, right: 24.3),
                  child: new Image.asset(
                    'images/instant_booking.png',
                    width: 58.3,
                    height: 39.3,
                  ),
                ),
                new Expanded(
                  child: new Container(
                    padding: const EdgeInsets.only(right: 21.3),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Bargain Booking',
                            style: new TextStyle(
                                color: const Color(0xff1eb91e),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Container(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            '(instant payment require)',
                            style: new TextStyle(
                              color: const Color(0xff1eb91e),
                            ),
                          ),
                        ),
                        new Container(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'With instant booking, traveller will accept your price if it is reasonable for them. \nAfter that,they will purchase and delivery your request. \nHowever, you cannot choose the traveller.',
                            textAlign: TextAlign.justify,
                            style: new TextStyle(
                              color: const Color(0xff959595),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new NextButtonWidget(),
        ],
      ),
    );
  }
}

class NextButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NextButtonStateWidget();
  }
}

class NextButtonStateWidget extends State<NextButtonWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> alphaAnimation;
  Animation<double> heightAnimation;

  NextButtonStateWidget();

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 1000),
      vsync: this,
    );

    alphaAnimation = new Tween<double>(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: new Interval(
          0.3,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
    heightAnimation = new Tween<double>(begin: 0.0, end: 47.2).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Opacity(
      opacity: alphaAnimation.value,
      child: new Container(
        child: new GestureDetector(
          onTap: () {},
          child: new Container(
            alignment: Alignment.center,
            color: const Color(0xffe04d25),
            height: heightAnimation.value,
            child: new Text(
              'NEXT',
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomUpWidget extends StatefulWidget {
  final Widget child;
  final int delay;

  BottomUpWidget({this.child, this.delay = 0});

  @override
  State<StatefulWidget> createState() {
    return new BottomUpStateWidget(child, delay);
  }
}

class BottomUpStateWidget extends State<BottomUpWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> alphaAnimation;
  Animation<double> marginAnimation;
  Widget child;
  int delay;

  BottomUpStateWidget(this.child, this.delay);

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 700 + delay),
      vsync: this,
    );

    alphaAnimation = new Tween<double>(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
    marginAnimation = new Tween<double>(begin: 10.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.0, 1.0),
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Opacity(
      opacity: alphaAnimation.value,
      child: new Container(
        margin: new EdgeInsets.only(top: marginAnimation.value),
        child: child,
      ),
    );
  }
}
