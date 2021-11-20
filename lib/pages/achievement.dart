import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Achievement extends StatelessWidget {
  const Achievement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 1.2,
        child: Stack(children: [
          Container(
              child: Row(children: [
            Expanded(
              flex: 1,
              child: VerticalDivider(
                color: Colors.tealAccent[700],
                thickness: 1.75,
                width: 10,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Expanded(flex: 8, child: SizedBox(width: 0))
          ])),
          Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Row(children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(backgroundColor: Colors.teal[700])),
                  Expanded(
                      flex: 8,
                      child: Container(
                          child: Column(children: [
                        Row(children: [
                          Text("ABU ROBOCON Tokyo 2017"),
                          SizedBox(width: 20.0, height: 0.0),
                          Text.rich(TextSpan(
                              text: "First Runner Up",
                              style: TextStyle(color: Colors.tealAccent[700]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  launchURL(
                                      'https://www.youtube.com/watch?v=u5b37wgaGD8');
                                })),
                          IconButton(
                            icon: Icon(Icons.play_circle_filled,
                                color: Colors.teal[600]),
                            onPressed: () {
                              launchURL(
                                  'https://www.youtube.com/watch?v=u5b37wgaGD8');
                            },
                          ),
                        ]),
                        SizedBox(height: 5.0),
                        Row(children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                    "Worked on robot programming of several robot prototypes",
                                    style: TextStyle(color: Colors.grey[350])),
                                SizedBox(height: 15.0),
                                Text(
                                  "Head of international robot management to coordinate the preparation of cargo shipping of robots to Japan",
                                  style: TextStyle(color: Colors.grey[350]),
                                ),
                              ]))
                        ])
                      ]))),
                ])
              ])),
        ]));
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
