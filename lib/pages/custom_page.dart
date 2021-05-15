import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/nav_bar.dart';
import 'package:personalwebsite/widgets/quote_slider.dart';

class CustomPage extends StatelessWidget {
  final String pageName;
  const CustomPage({Key key, @required this.pageName}) : super(key: key);

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
        getCustomPage(pageName),
      ]),
    ])));
  }

  Widget getCustomPage(String pageName) {
    switch (pageName) {
      case "Home":
        return QuoteSlider();
      case "About":
        return Text("About");
      case "Technical Notes":
        return Text("Technical Notes");
      case "Projects":
        return Text("Projects");
      case "Achievements":
        return Text("Achievements");
      default:
        return Text("Page not found");
    }
  }
}
