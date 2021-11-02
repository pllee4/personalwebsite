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
          routeName: "/Home",
          builder: (context) => CustomPage(pageName: "Home"));
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
      theme: ThemeData.from(colorScheme: const ColorScheme.light()),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      onGenerateRoute: _generateRoute,
      initialRoute: '/Home',
      onGenerateInitialRoutes: (initialRoute) =>
          [_generateRoute(RouteSettings(name: initialRoute))],
    );
  }
}
