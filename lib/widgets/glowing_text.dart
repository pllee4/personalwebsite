import 'package:flutter/material.dart';

class GlowingText extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;
  GlowingText(
      {Key? key,
      required this.text,
      this.color = Colors.white,
      this.fontSize = 42})
      : super(key: key);

  @override
  _GlowingTextState createState() => _GlowingTextState();
}

class _GlowingTextState extends State<GlowingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 7.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
            shadows: [
              Shadow(
                blurRadius: _animation.value,
                color: widget.color,
                offset: Offset(0, 0),
              ),
            ],
            fontFamily: 'Benne',
            fontSize: widget.fontSize,
            letterSpacing: 1,
            color: Colors.white));
  }
}
