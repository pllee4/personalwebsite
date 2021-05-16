import 'package:flutter/material.dart';

class TechnicalNotes extends StatefulWidget {
  TechnicalNotes({Key key}) : super(key: key);

  @override
  _TechnicalNotesState createState() => _TechnicalNotesState();
}

class _TechnicalNotesState extends State<TechnicalNotes> {
  // final ScrollController _scrollController = ScrollController();
  ScrollController _scrollControllerTitle, _scrollControllerContent;
  @override
  void initState() {
    super.initState();
    _scrollControllerTitle = ScrollController();
    _scrollControllerContent = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(children: [
      Expanded(
          child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollControllerTitle,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                ListTile(
                  title: Text('Item 1', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                Container(
                  color: Colors.yellow, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.blue, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.green, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.orange, // Yellow
                  height: 320.0,
                ),
              ])))),
      Expanded(
          flex: 4,
          child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollControllerContent,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Container(
                  color: Colors.yellow, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.blue, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.green, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.orange, // Yellow
                  height: 320.0,
                ),
                Container(
                  color: Colors.pink, // Yellow
                  height: 320.0,
                ),
              ]))))
    ]));
  }
}
