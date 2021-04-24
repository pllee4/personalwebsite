import 'package:flutter/material.dart';

import 'glowing_text.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'), radius: 70),
      SizedBox(width: 30),
      GlowingText(text: 'Pin Loon'),
    ]);
  }
}
