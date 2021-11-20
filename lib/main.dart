import 'package:flutter/material.dart';

import 'pages/custom_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/Home':
      return CustomPageRoute(
          routeName: "/Home",
          builder: (context) => CustomPage(pageName: "Home"));
    case '/About':
      return CustomPageRoute(
          routeName: "/About",
          builder: (context) => CustomPage(pageName: "About"));
    case '/Technical Notes':
      return CustomPageRoute(
          routeName: "/Technical Notes",
          builder: (context) => CustomPage(pageName: "Technical Notes"));
    case '/Projects':
      return CustomPageRoute(
          routeName: "/Projects",
          builder: (context) => CustomPage(pageName: "Projects"));
    case '/Achievements':
      return CustomPageRoute(
          routeName: "/Achievements",
          builder: (context) => CustomPage(pageName: "Achievements"));
    default:
      return CustomPageRoute(
          routeName: "/#", builder: (context) => CustomPage(pageName: "#"));
  }
}

class CustomPageRoute extends MaterialPageRoute {
  final String routeName;
  CustomPageRoute({Key key, @required this.routeName, builder})
      : super(builder: builder, settings: RouteSettings(name: routeName));
  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Loon Lee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dialogBackgroundColor: Colors.transparent,
        textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white70, fontSize: 20),
            headline2: TextStyle(color: Colors.white70, fontSize: 20),
            headline3: TextStyle(color: Colors.white, fontSize: 20),
            headline4: TextStyle(color: Colors.white, fontSize: 20),
            headline5: TextStyle(color: Colors.white, fontSize: 20),
            headline6: TextStyle(color: Colors.white70, fontSize: 18),
            subtitle1: TextStyle(color: Colors.white, fontSize: 18),
            subtitle2: TextStyle(color: Colors.white, fontSize: 18),
            bodyText1: TextStyle(color: Colors.white, fontSize: 18),
            bodyText2: TextStyle(color: Colors.white, fontSize: 18),
            button: TextStyle(
                color: Colors.blueGrey[200],
                decorationColor: Colors.blueGrey[50]),
            caption: TextStyle(color: Colors.white, fontSize: 18),
            overline: TextStyle(color: Colors.white, fontSize: 18)),
        colorScheme: const ColorScheme.light(),
      ),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      onGenerateRoute: _generateRoute,
      initialRoute: '/#',
      onGenerateInitialRoutes: (initialRoute) =>
          [_generateRoute(RouteSettings(name: initialRoute))],
    );
  }
}
