import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:personalwebsite/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(
          "am a Robotics Engineer",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "work with C/ C++",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "love new challenges",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "write algorithms for robots",
          speed: Duration(milliseconds: 60),
        )
      ],
    );
  }
}

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: Colors.white,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed))
        return BorderSide(
          color: Colors.teal[900],
          width: 2,
        );
      return BorderSide(
          color: Colors.teal[900], width: 2); // Defer to the widget's default.
    },
  ),
  overlayColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) return Colors.teal[900];
    return Colors.transparent; // Defer to the widget's default.
  }),
);

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, top: 50, right: 20.0),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('images/profile-clear.png'),
                      radius:
                          ResponsiveWidget.isLargeScreen(context) ? 150 : 100),
                  Container(
                      alignment: Alignment.center,
                      width: 250,
                      child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                            SizedBox(width: 0.0, height: 100.0),
                            Text(
                              "I",
                              style: TextStyle(
                                  color: Colors.teal[600], fontSize: 43.0),
                            ),
                            SizedBox(width: 20.0, height: 100.0),
                            AnimatedText()
                          ]))),
                  Container(
                      alignment: Alignment.center,
                      width: 500,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/github-white.png'),
                            iconSize: 50,
                            tooltip: "Github",
                            onPressed: () {
                              launchURL('https://github.com/pllee4');
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/linkedin-white.png'),
                            iconSize: 50,
                            tooltip: "Linkedin",
                            onPressed: () {
                              launchURL(
                                  'http://www.linkedin.com/in/pinloonlee');
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/book-white.png'),
                            iconSize: 50,
                            tooltip: "Gitbook",
                            onPressed: () {
                              launchURL('https://pinloon.gitbook.io');
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/email-white.png'),
                            iconSize: 50,
                            tooltip: "Email",
                            onPressed: () {
                              launchURL('mailto:pinloon_0428@hotmail.com');
                            },
                          )),
                        ],
                      ))),
                  const SizedBox(width: 20.0, height: 40.0),
                  Center(
                    child: OutlinedButton(
                      style: outlineButtonStyle,
                      onPressed: () {
                        launchURL(
                            'https://drive.google.com/file/d/1HvqbzHis658uvnWg77-bdHW3RR4RwAPd/view?usp=sharing');
                      },
                      child: Text('Resume',
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 30)),
                    ),
                  )
                ]),
          ),
          ResponsiveWidget.isLargeScreen(context)
              ? Expanded(
                  flex: 5,
                  child: Column(children: [
                    Row(
                      children: <Widget>[
                        Text("I'm ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 35.0)),
                        Text("Lee Pin Loon",
                            style: TextStyle(
                                color: Colors.teal[600], fontSize: 60.0)),
                      ],
                    ),
                    const SizedBox(height: 50.0, width: 0.0),
                    Row(children: <Widget>[
                      Text("5",
                          style: TextStyle(
                              color: Colors.teal[600], fontSize: 65.0)),
                      Text("++ Years of Experience in ",
                          style:
                              TextStyle(color: Colors.white, fontSize: 35.0)),
                      Text("Robotics",
                          style: TextStyle(
                              color: Colors.teal[600], fontSize: 35.0)),
                    ]),
                  ]))
              : SizedBox(width: 0, height: 0),
        ]));
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
