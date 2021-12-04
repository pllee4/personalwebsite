import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/responsive_widget.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          child: Text.rich(TextSpan(
              text: "I'm ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      ResponsiveWidget.isLargeScreen(context) ? 35.0 : 20.0),
              children: [
            TextSpan(
                text: "Lee Pin Loon",
                style: TextStyle(
                    color: Colors.teal[600],
                    fontSize:
                        ResponsiveWidget.isLargeScreen(context) ? 60.0 : 45.0))
          ]))),
      const SizedBox(height: 50.0, width: 0.0),
      Container(
          child: Text.rich(TextSpan(
              text: "5",
              style: TextStyle(
                  color: Colors.teal[600],
                  fontSize:
                      ResponsiveWidget.isLargeScreen(context) ? 65.0 : 50.0),
              children: [
            TextSpan(
                text: "++ Years of Experience in ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        ResponsiveWidget.isLargeScreen(context) ? 35.0 : 20.0),
                children: [
                  TextSpan(
                      text: "Robotics",
                      style: TextStyle(
                          color: Colors.teal[600],
                          fontSize: ResponsiveWidget.isLargeScreen(context)
                              ? 35.0
                              : 20.0))
                ])
          ]))),
    ]));
  }
}
