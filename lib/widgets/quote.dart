import 'package:catex/catex.dart';
import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  Quote(String quote, double fontSize, Color color) {
    this.quote = quote;
    this.fontSize = fontSize;
    this.color = color;
  }
  String quote;
  double fontSize;
  Color color;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
        style: TextStyle(fontSize: fontSize, color: color),
        child: CaTeX(quote));
  }
}
