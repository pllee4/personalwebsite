import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/nav_bar_item.dart';
import 'package:personalwebsite/widgets/profile.dart';
import 'package:personalwebsite/widgets/responsive_widget.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _itemPressed = "";
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? Container(
            margin: const EdgeInsets.only(left: 20.0, top: 50, right: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  // NavBarItem(
                  //     name: "Technical Notes",
                  //     onPressed: (String itemPressed) {
                  //       setState(() {
                  //         _itemPressed = itemPressed;
                  //         Navigator.pushNamed(context, '/Technical Notes');
                  //       });
                  //     },
                  //     itemPressed: _itemPressed),
                  // NavBarItem(
                  //     name: "Projects",
                  //     onPressed: (String itemPressed) {
                  //       setState(() {
                  //         _itemPressed = itemPressed;
                  //         Navigator.pushNamed(context, '/Projects');
                  //       });
                  //     },
                  //     itemPressed: _itemPressed),
                  NavBarItem(
                      name: "Achievements",
                      onPressed: (String itemPressed) {
                        setState(() {
                          _itemPressed = itemPressed;
                          Navigator.pushNamed(context, '/Achievements');
                        });
                      },
                      itemPressed: _itemPressed),
                ]))
        : Container(
            color: Colors.grey[900],
            child: ListView(padding: EdgeInsets.zero, children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                ),
                child: Profile(),
              ),
              Container(
                  color: Colors.grey[900],
                  child: Row(children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                          // NavBarItem(
                          //     name: "Technical Notes",
                          //     onPressed: (String itemPressed) {
                          //       setState(() {
                          //         _itemPressed = itemPressed;
                          //         Navigator.pushNamed(
                          //             context, '/Technical Notes');
                          //       });
                          //     },
                          //     itemPressed: _itemPressed),
                          // NavBarItem(
                          //     name: "Projects",
                          //     onPressed: (String itemPressed) {
                          //       setState(() {
                          //         _itemPressed = itemPressed;
                          //         Navigator.pushNamed(context, '/Projects');
                          //       });
                          //     },
                          //     itemPressed: _itemPressed),
                          NavBarItem(
                              name: "Achievements",
                              onPressed: (String itemPressed) {
                                setState(() {
                                  _itemPressed = itemPressed;
                                  Navigator.pushNamed(context, '/Achievements');
                                });
                              },
                              itemPressed: _itemPressed)
                        ]))
                  ]))
            ]));
  }
}
