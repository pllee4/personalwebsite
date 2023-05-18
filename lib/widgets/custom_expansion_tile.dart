import 'dart:math' show min;
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final List<Map<String, dynamic>> tabs;
  final void Function(String) onTabChanged;
  final List<int>? activeTabIndices;

  const CustomExpansionTile.fromJson({
    Key? key,
    required this.tabs,
    required this.onTabChanged,
    this.activeTabIndices,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  List<int>? activeTabIndices;

  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      if (activeTabIndices == null) {
        final newActiveTabData = _getFirstTabIndex(widget.tabs, []);
        List<int> newActiveTabIndices = newActiveTabData[0] as List<int>;
        String tabId = newActiveTabData[1].toString();
        if (newActiveTabIndices.length > 0) {
          setActiveTabIndices(newActiveTabIndices);
          widget.onTabChanged(tabId);
        }
      }
    });
  }

  List<Object> _getFirstTabIndex(
      List<Map<String, dynamic>> tabs, List<int> indices) {
    String? tabId;
    if (tabs.length > 0) {
      Map<String, dynamic> firstTab = tabs[0];
      tabId = firstTab['id'] ?? firstTab['title'];
      indices.add(0);

      if (firstTab['children'] != null) {
        final tabData = _getFirstTabIndex(firstTab['children'], indices);
        indices = tabData[0] as List<int>;
        tabId = tabData[1].toString();
      }
    }
    return [indices, tabId!.toString()];
  }

  void setActiveTabIndices(List<int> newIndices) {
    setState(() {
      activeTabIndices = newIndices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.height,
        child: Expanded(
            child: Material(
                type: MaterialType.transparency,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => SidebarItem(
                    widget.tabs[index],
                    widget.onTabChanged,
                    activeTabIndices as List<int>,
                    setActiveTabIndices,
                    index: index,
                  ),
                  itemCount: widget.tabs.length,
                ))));
  }
}

class SidebarItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final void Function(String) onTabChanged;
  final List<int> activeTabIndices;
  final void Function(List<int> newIndices) setActiveTabIndices;
  final int? index;
  final List<int>? indices;

  const SidebarItem(
    this.data,
    this.onTabChanged,
    this.activeTabIndices,
    this.setActiveTabIndices, {
    this.index,
    this.indices,
  }) : assert(
          (index == null && indices != null) ||
              (index != null && indices == null),
          'Exactly one parameter out of [index, indices] has to be provided',
        );

  bool _indicesMatch(List<int> a, List<int> b) {
    for (int i = 0; i < min(a.length, b.length); i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  Widget _buildTiles(Map<String, dynamic> root, BuildContext context) {
    final _indices = indices;
    if (root['children'] == null)
      return ListTile(
        selected: _indicesMatch(_indices as List<int>, activeTabIndices),
        title: Text(root['title'],
            style: TextStyle(color: Colors.white, fontSize: 18)),
        onTap: () {
          setActiveTabIndices(_indices);
          onTabChanged(root['id'] ?? root['title']);
        },
      );

    List<Widget> children = [];
    for (int i = 0; i < root['children'].length; i++) {
      Map<String, dynamic> item = root['children'][i];
      final itemIndices = [...?indices, i];
      children.add(
        SidebarItem(
          item,
          onTabChanged,
          activeTabIndices,
          setActiveTabIndices,
          indices: itemIndices,
        ),
      );
    }

    return ExpansionTile(
      title: Text(root['title'],
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            shadows: [
              Shadow(blurRadius: 1.0, color: Colors.white, offset: Offset(0, 0))
            ],
          )),
      childrenPadding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width / 40),
      tilePadding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width / 40),
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(data, context);
  }
}
