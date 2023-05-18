import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  final String quote;
  final double fontSize;
  final Color color;

  Quote(
      {Key? key,
      required this.quote,
      this.fontSize = 42,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
        style: TextStyle(fontSize: fontSize, color: color),
        child: Math.tex(quote));
  }
}
