import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/nav_bar_item.dart';
import 'package:personalwebsite/widgets/profile.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _itemPressed = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40.0, top: 50, right: 40.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Profile(),
          NavBarItem(
              name: "Home",
              onPressed: (String itemPressed) {
                setState(() {
                  _itemPressed = itemPressed;
                  Navigator.pushNamed(context, '/Home');
                });
              },
              itemPressed: _itemPressed),
          NavBarItem(
              name: "About",
              onPressed: (String itemPressed) {
                setState(() {
                  _itemPressed = itemPressed;
                  Navigator.pushNamed(context, '/About');
                });
              },
              itemPressed: _itemPressed),
          NavBarItem(
              name: "Technical Notes",
              onPressed: (String itemPressed) {
                setState(() {
                  _itemPressed = itemPressed;
                  Navigator.pushNamed(context, '/Technical Notes');
                });
              },
              itemPressed: _itemPressed),
          NavBarItem(
              name: "Projects",
              onPressed: (String itemPressed) {
                setState(() {
                  _itemPressed = itemPressed;
                  Navigator.pushNamed(context, '/Projects');
                });
              },
              itemPressed: _itemPressed),
          NavBarItem(
              name: "Achievements",
              onPressed: (String itemPressed) {
                setState(() {
                  _itemPressed = itemPressed;
                  Navigator.pushNamed(context, '/Achievements');
                });
              },
              itemPressed: _itemPressed),
        ]));
  }
}
