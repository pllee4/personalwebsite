import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double percentage;
  final String label;
  AnimatedProgressBar(
      {Key key, @required this.percentage, @required this.label})
      : super(key: key);

  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation =
        Tween(begin: 0.0, end: widget.percentage).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    Future.delayed(Duration(milliseconds: 500), () {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        widget.label,
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(height: 30),
      LinearProgressIndicator(
        value: (_animation.value) / 100.0,
        color: Colors.teal[800],
        backgroundColor: Colors.transparent,
      ),
      SizedBox(height: 30),
      Text((_animation.value).toInt().toString() + "%"),
    ]);
  }
}
