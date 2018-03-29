import 'package:flutter/material.dart';
import 'request_indicator.dart';

import 'how_screen.dart';

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
                searchWidget,
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                            top: 17.3, left: 9.7, right: 9.7),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'Product Information',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: const Color(0xff282826)),
                        ),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 9.7, right: 9.7),
                        child: new Image.asset(
                          'images/shoe_pic.png',
                          height: 253.3,
                          fit: BoxFit.fill,
                        ),
                      ),
                      new Container(
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
                      new Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 28.7, horizontal: 19.7),
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          new GestureDetector(
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
              height: 47.2,
              child: new Text(
                'NEXT',
                style: new TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
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
      margin: const EdgeInsets.symmetric(vertical: 10.3, horizontal: 9.7),
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
  );
}
