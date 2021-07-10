import 'package:flutter/material.dart';
// import 'package:personalwebsite/pages/technical_notes.dart';
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
        ...getCustomPage(pageName, context),
      ]),
    ])));
  }

  List<Widget> getCustomPage(String pageName, BuildContext context) {
    switch (pageName) {
      case "Home":
        return [
          SizedBox(height: (MediaQuery.of(context).size.height) / 3.5 - 10.0),
          QuoteSlider()
        ];
      case "About":
        return [Text("About")];
      case "Technical Notes":
        // return [TechnicalNotes()];
        return [Text("Technical Notes")];
      case "Projects":
        return [Text("Projects")];
      case "Achievements":
        return [Text("Achievements")];
      default:
        return [Text("Page not found")];
    }
  }
}
