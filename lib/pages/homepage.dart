import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/nav_bar.dart';
import 'package:personalwebsite/widgets/quote.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _quoteIndex = 0;
  List<Widget> quoteList = [
    Column(children: [
      Quote('1.02^{365} = 1377.4', 42, Colors.white),
      Quote('0.98^{365} = 0.0006', 42, Colors.white)
    ]),
    Column(children: [
      Text("Work hard in silence, let your success be your noise",
          style: TextStyle(
            fontFamily: 'Benne',
            fontSize: 42,
            color: Colors.white,
          )),
      Text("Frank Ocean",
          style: TextStyle(
            backgroundColor: Colors.blueGrey,
            fontFamily: 'Benne',
            fontSize: 42,
            color: Colors.white,
          )),
    ]),
    Column(children: [
      Text("Growth and comfort do not coexist",
          style: TextStyle(
            fontFamily: 'Benne',
            fontSize: 42,
            color: Colors.white,
          )),
      Text("Ginni Rometty",
          style: TextStyle(
            backgroundColor: Colors.blueAccent,
            fontFamily: 'Benne',
            fontSize: 42,
            color: Colors.white,
          )),
    ])
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: Stack(children: <Widget>[
      Container(
          child: Stack(children: <Widget>[
        Positioned.fill(
            child: Ink.image(
                image: AssetImage('images/mountain.jpg'),
                fit: BoxFit.cover,
                child: Container())),
        Positioned(
            bottom: (MediaQuery.of(context).size.height) / 2,
            left: 0.0,
            right: 0.0,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Column(children: [
                  Quote('1.02^{365} = 1377.4', 42, Colors.white),
                  Quote('0.98^{365} = 0.0006', 42, Colors.white),
                  Text("Work hard in silence, let your success be your noise",
                      style: TextStyle(
                        // shadows: [
                        //   Shadow(
                        //     blurRadius: 7.0,
                        //     color: Colors.white,
                        //     offset: Offset(0, 0),
                        //   ),
                        // ],
                        fontFamily: 'Benne',
                        fontSize: 42,
                        color: Colors.white,
                      )),
                  Text("Frank Ocean",
                      style: TextStyle(
                        backgroundColor: Colors.blueGrey,
                        fontFamily: 'Benne',
                        fontSize: 42,
                        color: Colors.white,
                      )),
                  // CarouselSlider(
                  // options: CarouselOptions(
                  //   height: 100.0,
                  //   autoPlay: true,
                  //   autoPlayInterval: Duration(seconds: 3),
                  //   autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //   autoPlayCurve: Curves.fastOutSlowIn,
                  //   pauseAutoPlayOnTouch: true,
                  //   aspectRatio: 2.0,
                  //   onPageChanged: (index, reason) {
                  //     setState(() {
                  //       _quoteIndex = index;
                  //     });
                  //   },
                  // ),
                  // items: quoteList.map((quote) {
                  //   return quote;
                  // }).toList(),
                  // )
                ]))),
      ])),
      NavBar(),
    ])));
  }
}
