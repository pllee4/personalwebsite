import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/nav_bar.dart';
import 'package:personalwebsite/widgets/quote_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ])),
      Column(children: <Widget>[
        NavBar(),
        SizedBox(height: (MediaQuery.of(context).size.height) / 4 - 10.0),
        QuoteSlider(),
      ]),
    ])));
  }
}
