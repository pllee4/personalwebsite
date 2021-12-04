import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AchievementItem extends StatelessWidget {
  final String title;
  final String award;
  final String subtitle1;

  final String subtitle2;
  final String url;
  final IconData iconData;

  AchievementItem({
    Key key,
    @required this.title,
    @required this.award,
    @required this.subtitle1,
    this.subtitle2,
    this.url,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 1,
          child: Container(
              child: Column(children: [
            SizedBox(width: 0.0, height: 10),
            Row(
              children: [
                SizedBox(
                    width: ResponsiveWidget.isLargeScreen(context)
                        ? MediaQuery.of(context).size.width * 0.06
                        : 5.0,
                    height: 0.0),
                Icon(
                  Icons.label_important,
                  color: Colors.teal[400],
                  size: ResponsiveWidget.isLargeScreen(context) ? 50 : 30,
                ),
              ],
            )
          ]))),
      Expanded(
          flex: 8,
          child: Container(
              child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Row(children: [
                  SizedBox(width: 0.0, height: 5.0),
                  ResponsiveWidget.isLargeScreen(context)
                      ? Text(this.title)
                      : Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text(this.title)])),
                  ResponsiveWidget.isLargeScreen(context)
                      ? SizedBox(width: 60.0, height: 0.0)
                      : SizedBox(width: 10.0, height: 0.0),
                  Text.rich(
                    TextSpan(
                        text: this.award,
                        style: TextStyle(color: Colors.tealAccent[700]),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (this.url != null) launchURL(this.url);
                          }),
                  ),
                  IconButton(
                    icon: Icon(iconData, color: Colors.teal[400]),
                    onPressed: () {
                      if (this.url != null) launchURL(this.url);
                    },
                  )
                ])),
            SizedBox(height: 5.0),
            Row(children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(this.subtitle1,
                        style: TextStyle(color: Colors.grey[350])),
                    if (subtitle2 != null) SizedBox(height: 15.0),
                    if (subtitle2 != null)
                      Text(
                        subtitle2,
                        style: TextStyle(color: Colors.grey[350]),
                      ),
                  ]))
            ]),
            SizedBox(height: 20.0),
          ])))
    ]);
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
