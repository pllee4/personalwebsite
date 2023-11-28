import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
  CustomPageRoute({Key? key, required this.routeName, builder})
      : super(builder: builder, settings: RouteSettings(name: routeName));
  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() async {
    await rootBundle.load('images/dark-green.jpg');
    await rootBundle.load('images/profile-clear.png');
    await rootBundle.load('images/github-white.png');
    await rootBundle.load('images/linkedin-white.png');
    await rootBundle.load('images/book-white.png');
    await rootBundle.load('images/email-white.png');
    precacheImage(AssetImage("images/dark-green.jpg"), context);
    precacheImage(AssetImage("images/profile-clear.png"), context);
    precacheImage(AssetImage("images/github-white.png"), context);
    precacheImage(AssetImage("images/linkedin-white.png"), context);
    precacheImage(AssetImage("images/book-white.png"), context);
    precacheImage(AssetImage("images/email-white.png"), context);
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Loon Lee',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.bigStone,
        textTheme: TextTheme(
            displayLarge: TextStyle(color: Colors.white70, fontSize: 20),
            displayMedium: TextStyle(color: Colors.white70, fontSize: 20),
            displaySmall: TextStyle(color: Colors.white, fontSize: 20),
            headlineMedium: TextStyle(color: Colors.white, fontSize: 20),
            headlineSmall: TextStyle(color: Colors.white, fontSize: 20),
            titleLarge: TextStyle(color: Colors.white70, fontSize: 18),
            titleMedium: TextStyle(color: Colors.white, fontSize: 16),
            titleSmall: TextStyle(color: Colors.white, fontSize: 18),
            bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
            labelLarge: TextStyle(
                color: Colors.blueGrey[200],
                decorationColor: Colors.blueGrey[50]),
            bodySmall: TextStyle(color: Colors.white, fontSize: 18),
            labelSmall: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.bigStone),
      onGenerateRoute: _generateRoute,
      initialRoute: '/#',
      onGenerateInitialRoutes: (initialRoute) =>
          [_generateRoute(RouteSettings(name: initialRoute))],
    );
  }
}
