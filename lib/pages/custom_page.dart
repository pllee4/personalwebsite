import 'package:flutter/material.dart';
import 'package:personalwebsite/pages/about.dart';
import 'package:personalwebsite/pages/home.dart';
import 'package:personalwebsite/pages/splash_screen.dart';
// import 'package:personalwebsite/pages/technical_notes.dart';
import 'package:personalwebsite/widgets/nav_bar.dart';
import 'package:personalwebsite/widgets/responsive_widget.dart';

class CustomPage extends StatelessWidget {
  final String pageName;
  CustomPage({Key key, @required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ResponsiveWidget.isLargeScreen(context)
            ? null
            : AppBar(
                backgroundColor: Colors.grey[900],
                leading: Builder(
                  builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  ),
                ),
              ),
        drawer: Drawer(
          child: NavBar(),
        ),
        body: SizedBox.expand(
            child: Stack(children: <Widget>[
          Container(
              child: Stack(children: <Widget>[
            Positioned.fill(
                child: Ink.image(
                    image: AssetImage('images/dark-green.jpg'),
                    fit: BoxFit.cover,
                    child: Container())),
          ])),
          SingleChildScrollView(
              child: pageName == "#"
                  ? SplashScreen()
                  : Column(children: <Widget>[
                      ResponsiveWidget.isLargeScreen(context)
                          ? NavBar()
                          : SizedBox(width: 0, height: 0),
                      ...getCustomPage(pageName, context),
                    ])),
        ])));
  }

  List<Widget> getCustomPage(String pageName, BuildContext context) {
    switch (pageName) {
      case "Home":
        return [Home()];
      case "About":
        return [About()];
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
