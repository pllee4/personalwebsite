import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/profile.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40.0, top: 20, right: 40.0),
        child: Row(children: [
          Profile(),
          SizedBox(width: (MediaQuery.of(context).size.width) / 3),
          Text("Technical Notes",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 24, color: Colors.white)),
          SizedBox(width: 30),
          Text("Projects",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 24, color: Colors.white)),
          IconButton(
            icon: Icon(Icons.brightness_6),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.white,
            onPressed: () {
              DynamicTheme.of(context).setBrightness(
                  Theme.of(context).brightness == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark);
            },
          ),
        ]));
  }
}
