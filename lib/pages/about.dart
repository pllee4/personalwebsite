import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:html' as html;

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
          "worked with C/ C++",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "love new challenges",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "wrote algorithms for robots",
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
        margin: const EdgeInsets.only(left: 40.0, top: 50, right: 40.0),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('images/profile-clear.png'),
                      radius: 200),
                  Row(children: <Widget>[
                    SizedBox(width: 220.0, height: 100.0),
                    Text(
                      "I",
                      style: TextStyle(color: Colors.teal[600], fontSize: 43.0),
                    ),
                    const SizedBox(width: 20.0, height: 100.0),
                    AnimatedText()
                  ]),
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
                              html.window
                                  .open('https://github.com/pllee4', "_blank");
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/linkedin-white.png'),
                            iconSize: 50,
                            tooltip: "Linkedin",
                            onPressed: () {
                              html.window.open(
                                  'http://www.linkedin.com/in/pinloonlee',
                                  "_blank");
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/book-white.png'),
                            iconSize: 50,
                            tooltip: "Gitbook",
                            onPressed: () {
                              html.window
                                  .open('https://pinloon.gitbook.io', "_blank");
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Image.asset('images/email-white.png'),
                            iconSize: 50,
                            tooltip: "Email",
                            onPressed: () {
                              html.window.open(
                                  'mailto:pinloon_0428@hotmail.com', "_blank");
                            },
                          )),
                        ],
                      ))),
                  const SizedBox(width: 20.0, height: 40.0),
                  Center(
                    child: OutlinedButton(
                      style: outlineButtonStyle,
                      onPressed: () {
                        html.window.open(
                            'https://drive.google.com/file/d/1HvqbzHis658uvnWg77-bdHW3RR4RwAPd/view?usp=sharing',
                            "pdf");
                      },
                      child: Text('Resume',
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 30)),
                    ),
                  )
                ]),
          ),
          Expanded(
              flex: 5,
              child: Column(children: [
                Row(
                  children: <Widget>[
                    Text("I'm ",
                        style: TextStyle(color: Colors.white, fontSize: 40.0)),
                    Text("Lee Pin Loon",
                        style:
                            TextStyle(color: Colors.teal[600], fontSize: 60.0)),
                  ],
                ),
                const SizedBox(height: 50.0),
                Row(children: <Widget>[
                  Text("5",
                      style:
                          TextStyle(color: Colors.teal[600], fontSize: 65.0)),
                  Text("++ Years of Experience in ",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  Text("Robotics",
                      style:
                          TextStyle(color: Colors.teal[600], fontSize: 40.0)),
                ]),
              ])),
        ]));
  }
}
