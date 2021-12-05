import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/responsive_widget.dart';

class AboutDetails extends StatelessWidget {
  final List<String> algorithmList = [
    'Obstacle avoidance',
    'Trajectory prediction',
    'Control token handling',
    'Handshaking between client and robot',
  ];
  final List<String> middlewareList = [
    'Zephyr',
    'FreeRTOS',
    'ROS 1',
    'ROS 2',
  ];
  final List<String> toolList = [
    'Docker-compose',
    'CMake',
    'Conan',
    'Protocol Buffer'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: ResponsiveWidget.isLargeScreen(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
          Container(
              child: Text.rich(TextSpan(
                  text: "I'm ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveWidget.isLargeScreen(context)
                          ? 35.0
                          : 20.0),
                  children: [
                TextSpan(
                    text: "Lee Pin Loon",
                    style: TextStyle(
                        color: Colors.teal[600],
                        fontSize: ResponsiveWidget.isLargeScreen(context)
                            ? 60.0
                            : 45.0))
              ]))),
          SizedBox(
              height: ResponsiveWidget.isLargeScreen(context) ? 50.0 : 20.0,
              width: 0.0),
          Container(
              child: Text.rich(TextSpan(
                  text: "5",
                  style: TextStyle(
                      color: Colors.teal[600],
                      fontSize: ResponsiveWidget.isLargeScreen(context)
                          ? 65.0
                          : 50.0),
                  children: [
                TextSpan(
                    text: "++ Years of Experience in ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveWidget.isLargeScreen(context)
                            ? 35.0
                            : 20.0),
                    children: [
                      TextSpan(
                          text: "Robotics",
                          style: TextStyle(
                              color: Colors.teal[600],
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 35.0
                                  : 20.0))
                    ])
              ]))),
          SizedBox(
              height: ResponsiveWidget.isLargeScreen(context) ? 50.0 : 20.0,
              width: 0.0),
          if (ResponsiveWidget.isLargeScreen(context)) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutDetailsCard(
                    title: "Algorithm",
                    iconData: Icons.code,
                    detailsList: algorithmList),
                AboutDetailsCard(
                    title: "RTOS / Middleware",
                    iconData: Icons.layers,
                    detailsList: middlewareList),
                AboutDetailsCard(
                    title: "Tools",
                    iconData: Icons.build,
                    detailsList: toolList),
              ],
            )
          ] else ...[
            AboutDetailsCard(
                title: "Algorithm",
                iconData: Icons.code,
                detailsList: algorithmList),
            SizedBox(height: 20.0, width: 0.0),
            AboutDetailsCard(
                title: "RTOS / Middleware",
                iconData: Icons.layers,
                detailsList: middlewareList),
            SizedBox(height: 20.0, width: 0.0),
            AboutDetailsCard(
                title: "Tools", iconData: Icons.build, detailsList: toolList),
            SizedBox(height: 20.0, width: 0.0),
          ]
        ]));
  }
}

class AboutDetailsCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final List<String> detailsList;

  AboutDetailsCard(
      {Key key,
      @required this.title,
      @required this.iconData,
      @required this.detailsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ResponsiveWidget.isLargeScreen(context)
            ? MediaQuery.of(context).size.width / 5.5
            : double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Colors.teal.withOpacity(0.3),
                Colors.tealAccent.withOpacity(0.3)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Column(children: [
          ListTile(
            title: Text(this.title),
            trailing: Icon(this.iconData, color: Colors.tealAccent),
          ),
          for (var item in this.detailsList)
            ListTile(
              title: Text(item, style: TextStyle(color: Colors.grey[350])),
              leading: Icon(Icons.auto_awesome, color: Colors.tealAccent),
            ),
        ]));
  }
}
