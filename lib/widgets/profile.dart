import 'package:flutter/material.dart';

// import 'glowing_text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('Pin Loon',
          style: TextStyle(
              shadows: [
                Shadow(
                    blurRadius: 2.0, color: Colors.white, offset: Offset(0, 0))
              ],
              fontFamily: 'Benne',
              fontSize: 42,
              letterSpacing: 1,
              color: Colors.white))
      // GlowingText(text: 'Pin Loon'),
    ]);
  }
}
