import 'package:flutter/material.dart';

class QuoteAuthor extends StatefulWidget {
  final String quote;
  final String author;
  final Color backgroundColor;
  final double fontSize;
  final Color color;

  QuoteAuthor(
      {Key key,
      @required this.quote,
      @required this.author,
      this.backgroundColor = Colors.blueGrey,
      this.fontSize = 42,
      this.color = Colors.white})
      : super(key: key);

  @override
  _QuoteAuthorState createState() => _QuoteAuthorState();
}

class _QuoteAuthorState extends State<QuoteAuthor> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Text(widget.quote,
          style: TextStyle(
            fontFamily: 'Benne',
            fontSize: widget.fontSize,
            color: widget.color,
          )),
      SizedBox(height: 30),
      Text(widget.author,
          style: TextStyle(
            backgroundColor: widget.backgroundColor,
            fontFamily: 'Benne',
            fontSize: widget.fontSize,
            color: widget.color,
          )),
    ]);
  }
}
