import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final String name;
  final Function(String) onPressed;
  final String itemPressed;
  NavBarItem(
      {Key key,
      @required this.name,
      @required this.onPressed,
      this.itemPressed})
      : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Map _isHovering = new Map<String, bool>();

  @override
  void initState() {
    super.initState();
    _isHovering[widget.name] = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: (value) {
          setState(() {
            print(widget.name + "Hovered");
            value
                ? _isHovering[widget.name] = true
                : _isHovering[widget.name] = false;
          });
        },
        onTap: () {},
        child: Column(children: [
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Text(widget.name,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      color: Colors.white)),
              onPressed: () {
                widget.onPressed(widget.name);
              }),
          SizedBox(height: 5),
          Visibility(
            visible:
                _isHovering[widget.name] | (widget.name == widget.itemPressed),
            child: Container(
              height: 2,
              width: 12.0 * widget.name.length,
              color: Colors.white,
            ),
          )
        ]));
  }
}
