import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/custom_expansion_tile.dart';

class TechnicalNotes extends StatefulWidget {
  TechnicalNotes({Key key}) : super(key: key);

  @override
  _TechnicalNotesState createState() => _TechnicalNotesState();
}

class _TechnicalNotesState extends State<TechnicalNotes> {
  // with SingleTickerProviderStateMixin {
  ScrollController _scrollControllerTitle, _scrollControllerContent;
  GlobalKey _sidebarKey;
  final List<Map<String, dynamic>> tabData = [
    {
      'title': 'Linux',
      'children': [
        {'title': 'Wireguard'},
        {'title': 'GCC'},
        {'title': 'Conan'},
      ],
    },
    {
      'title': 'RTOS',
      'children': [
        {
          'title': 'Zephyr',
          'children': [
            {'title': 'Add in custom board configuration'},
          ],
        },
      ],
    },
    {
      'title': 'Microcontroller',
      'children': [
        {'title': 'STM32'},
        {'title': 'Raspberry Pi'},
      ],
    },
    {
      'title': 'Application platform',
      'children': [
        {'title': 'Docker'},
      ],
    },
    {
      'title': 'Git',
      'children': [
        {'title': 'Create SSH Key'},
        {'title': 'Gitlab CI'},
        {'title': 'Github Workflows'},
      ]
    },
  ];

  String tab;
  void setTab(String newTab) {
    setState(() {
      tab = newTab;
      print(tab);
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollControllerTitle = ScrollController();
    _scrollControllerContent = ScrollController();
    _sidebarKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final sidebar = CustomExpansionTile.fromJson(
      key: _sidebarKey,
      tabs: tabData,
      onTabChanged: setTab,
    );
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollControllerTitle,
              child: SingleChildScrollView(child: sidebar))),
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
