import 'package:flutter/material.dart';
import 'request_indicator.dart';
import 'how_screen.dart';
import 'display_anim.dart';

class WhichScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WhichStateScreen();
  }
}

class WhichStateScreen extends State<WhichScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('WHICH?'),
        centerTitle: true,
        leading: new IconButton(
            icon: new Image.asset('images/back_icon.png'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new RequestIndicatorWidget(),
                new SearchWidget(),
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new TopDownWidget(
                        child: new Container(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Product Information',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: const Color(0xff282826)),
                          ),
                        ),
                      ),
                      new ShoeWidget(),
                      new BottomUpWidget(
                        child: new Container(
                          padding: const EdgeInsets.only(
                              left: 9.7, right: 9.7, top: 10.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Image.asset('images/item_small.png',
                                  height: 78.0, fit: BoxFit.fill),
                              new Image.asset('images/item_small.png',
                                  height: 78.0, fit: BoxFit.fill),
                              new Image.asset('images/item_small.png',
                                  height: 78.0, fit: BoxFit.fill),
                              new Image.asset('images/item_small.png',
                                  height: 78.0, fit: BoxFit.fill),
                            ],
                          ),
                        ),
                      ),
                      new BottomUpWidget(
                        child: new Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 19.7),
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                alignment: Alignment.centerLeft,
                                child: new Text(
                                  'Product Name',
                                  style: new TextStyle(
                                    color: const Color(0xff959595),
                                    fontSize: 12.7,
                                  ),
                                ),
                              ),
                              new Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    top: 10.7, bottom: 10.7, left: 4.0),
                                child: new Text(
                                  'Nike Air Max',
                                  style: new TextStyle(
                                    color: const Color(0xff3b3b3b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.3,
                                  ),
                                ),
                              ),
                              new Container(
                                margin: const EdgeInsets.only(bottom: 28.3),
                                height: 1.0,
                                color: const Color(0x33282826),
                              ),
                              new Container(
                                alignment: Alignment.centerLeft,
                                child: new Text(
                                  'Product Name',
                                  style: new TextStyle(
                                    color: const Color(0xff959595),
                                    fontSize: 12.7,
                                  ),
                                ),
                              ),
                              new Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    top: 10.7, bottom: 10.7, left: 4.0),
                                child: new Text(
                                  'Nike Air Max',
                                  style: new TextStyle(
                                    color: const Color(0xff3b3b3b),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.3,
                                  ),
                                ),
                              ),
                              new Container(
                                padding: const EdgeInsets.only(bottom: 28.3),
                                height: 1.0,
                                color: const Color(0x33282826),
                              )
                            ],
                          ),
                        ),
                        delay: 200,
                      ),
                    ],
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

class ShoeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ShoeStateWidget();
  }
}

class ShoeStateWidget extends State<ShoeWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );
    final CurvedAnimation curve = new CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    Tween<double> tween = new Tween<double>(begin: 20.0, end: 40.0);

    animation = tween.animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        tween.begin = 10.0;
        tween.end = 40.0;

        animationController.reverse();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: animation.value, left: 0.0, right: 0.0),
      child: new Image.asset(
        'images/shoe_pic.png',
        height: 257.9,
        fit: BoxFit.fill,
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
      duration: new Duration(milliseconds: 1200 + delay),
      vsync: this,
    );

    alphaAnimation = new Tween<double>(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: new Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    marginAnimation = new Tween<double>(begin: 30.0, end: 0.0).animate(
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

class TopDownWidget extends StatefulWidget {
  final Widget child;
  final int delay;

  TopDownWidget({this.child, this.delay = 0});

  @override
  State<StatefulWidget> createState() {
    return new TopDownStateWidget(child, delay);
  }
}

class TopDownStateWidget extends State<TopDownWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationController2;
  Animation<double> alphaAnimation;
  Animation<double> marginAnimation;
  Widget child;
  int delay;

  TopDownStateWidget(this.child, this.delay);

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
        curve: new Interval(0.3, 1.0, curve: Curves.ease),
      ),
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();

    animationController2 = new AnimationController(
      duration: new Duration(milliseconds: 400 + delay),
      vsync: this,
    );
    Tween<double> marginT = new Tween<double>(begin: 0.0, end: 37.3);
    marginAnimation = marginT.animate(
      new CurvedAnimation(
          parent: animationController2, curve: Curves.easeInOut),
    );
    marginAnimation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        marginT.begin = 17.3;
        marginT.end = 37.3;
        animationController2.reverse();
      }
    });
    animationController2.addListener(() {
      setState(() {});
    });
    animationController2.forward();
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
        margin: new EdgeInsets.only(
            top: marginAnimation.value, left: 9.7, right: 9.7),
        child: child,
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
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new HowScreen(),
              ),
            );
          },
          child: new Container(
            alignment: Alignment.center,
            color: const Color(0xffe04d25),
            height: heightAnimation.value,
            child: new Text(
              'NEXT',
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.3),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchStateWidget();
  }
}

class SearchStateWidget extends State<SearchWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> alphaAnimation;
  Animation<double> marginAnimation;

  SearchStateWidget();

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 1000),
      vsync: this,
    );

    alphaAnimation = new Tween<double>(begin: 0.5, end: 1.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: new Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );
    marginAnimation = new Tween<double>(begin: 20.3, end: 10.3).animate(
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
        color: const Color(0xffee613a),
        child: new Container(
          height: 36.7,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(const Radius.circular(2.7)),
          ),
          margin: new EdgeInsets.symmetric(
              vertical: marginAnimation.value, horizontal: 9.7),
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
    );
  }
}
