import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'), radius: 70),
      SizedBox(width: 30),
      Text("Pin Loon",
          style: TextStyle(
              fontFamily: 'Benne',
              fontSize: 42,
              letterSpacing: 1,
              color: Colors.white)),
    ]);
  }
}
