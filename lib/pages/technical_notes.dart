import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:personalwebsite/widgets/custom_expansion_tile.dart';

class TechnicalNotes extends StatefulWidget {
  TechnicalNotes({Key? key}) : super(key: key);

  @override
  _TechnicalNotesState createState() => _TechnicalNotesState();
}

class _TechnicalNotesState extends State<TechnicalNotes> {
  // with SingleTickerProviderStateMixin {
  late ScrollController _scrollControllerTitle, _scrollControllerContent;
  late GlobalKey _sidebarKey;
  final List<Map<String, dynamic>> tabData = [
    {'title': 'Content'},
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

  String tab = "Content";
  void setTab(String newTab) {
    setState(() {
      tab = newTab;
      print(tab);
      print(_sidebarKey);
      print(tab[0].toLowerCase() + tab.substring(1));
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
              thumbVisibility: true,
              controller: _scrollControllerTitle,
              child: SingleChildScrollView(child: sidebar))),
      Expanded(
          flex: 5,
          child: Scrollbar(
              thumbVisibility: true,
              controller: _scrollControllerContent,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Container(
                  color: Colors.blueGrey[900]!.withOpacity(0.6),
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                      future: rootBundle.loadString("markdown/" +
                          tab[0].toLowerCase() +
                          tab.substring(1) +
                          ".md"),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Markdown(
                              data: snapshot.requireData,
                              styleSheet: MarkdownStyleSheet(
                                  p: TextStyle(fontSize: 18),
                                  code: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  codeblockDecoration: BoxDecoration(
                                    color: Colors.black87.withOpacity(0.6),
                                  )));
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ]))))
    ]));
  }
}
