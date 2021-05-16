import 'package:flutter/material.dart';

class TechnicalNotes extends StatefulWidget {
  TechnicalNotes({Key key}) : super(key: key);

  @override
  _TechnicalNotesState createState() => _TechnicalNotesState();
}

class _TechnicalNotesState extends State<TechnicalNotes> {
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
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollControllerTitle,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                ExpansionTile(
                    title: Text('RTOS', style: TextStyle(color: Colors.white)),
                    childrenPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 30),
                    tilePadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 40),
                    children: <Widget>[
                      ListTile(
                          title: Text('Zephyr',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          })
                    ]),
                ExpansionTile(
                    title: Text('Linux', style: TextStyle(color: Colors.white)),
                    childrenPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 30),
                    tilePadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 40),
                    children: <Widget>[
                      ListTile(
                          title: Text('Wireguard',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          }),
                      ListTile(
                          title: Text('GCC',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          }),
                      ListTile(
                          title: Text('Conan',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          })
                    ]),
              ])))),
      Expanded(
          flex: 5,
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
