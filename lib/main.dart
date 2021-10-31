import 'package:flutter/material.dart';

import 'pages/custom_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pin Loon Lee',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(colorScheme: const ColorScheme.light()),
        darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
        initialRoute: '/Home',
        routes: {
          '/Home': (context) => CustomPage(pageName: "Home"),
          '/About': (context) => CustomPage(pageName: "About"),
          '/Technical Notes': (context) =>
              CustomPage(pageName: "Technical Notes"),
          '/Projects': (context) => CustomPage(pageName: "Projects"),
          '/Achievements': (context) => CustomPage(pageName: "Achievements"),
        });
  }
}
