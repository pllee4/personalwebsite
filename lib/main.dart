import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/custom_page.dart';

void main() {
  runApp(MyApp());
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) {
        return brightness == Brightness.light
            ? ThemeData(
                primarySwatch: Colors.blueGrey,
                backgroundColor: Colors.white,
                colorScheme:
                    ThemeData().colorScheme.copyWith(secondary: Colors.white),
                unselectedWidgetColor: Colors.blueGrey[300],
                cardColor: Colors.blueGrey[50],
                primaryTextTheme: TextTheme(
                  headline5:
                      TextStyle(color: Colors.blueGrey[300], fontSize: 20),
                  headline6:
                      TextStyle(color: Colors.blueGrey[300], fontSize: 18),
                  bodyText1:
                      TextStyle(color: Colors.blueGrey[300], fontSize: 18),
                  bodyText2:
                      TextStyle(color: Colors.blueGrey[300], fontSize: 18),
                  button: TextStyle(
                    color: Colors.blueGrey,
                    decorationColor: Colors.blueGrey[300],
                  ),
                  subtitle1: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  subtitle2: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 18,
                  ),
                  headline1: TextStyle(color: Colors.blueGrey[800]),
                ),
                pageTransitionsTheme: NoTransitionsOnWeb(),
                bottomAppBarColor: Colors.blueGrey[900],
                iconTheme: IconThemeData(color: Colors.blueGrey),
                brightness: brightness,
              )
            : ThemeData(
                primarySwatch: Colors.blueGrey,
                backgroundColor: Colors.blueGrey[900],
                colorScheme:
                    ThemeData().colorScheme.copyWith(secondary: Colors.white),
                unselectedWidgetColor: Colors.blueGrey[300],
                cardColor: Colors.black,
                dividerColor: Colors.blueGrey[900].withOpacity(0.6),
                primaryTextTheme: TextTheme(
                  headline5: TextStyle(color: Colors.white, fontSize: 20),
                  headline6: TextStyle(color: Colors.white70, fontSize: 18),
                  bodyText1: TextStyle(color: Colors.white, fontSize: 18),
                  bodyText2: TextStyle(color: Colors.white, fontSize: 18),
                  button: TextStyle(
                    color: Colors.blueGrey[200],
                    decorationColor: Colors.blueGrey[50],
                  ),
                  subtitle1: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 18,
                  ),
                  subtitle2: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  headline1: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                pageTransitionsTheme: NoTransitionsOnWeb(),
                bottomAppBarColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.blueGrey[200]),
                brightness: brightness,
              );
      },
      themedWidgetBuilder: (context, data) => MaterialApp(
          title: 'Pin Loon Lee',
          debugShowCheckedModeBanner: false,
          theme: data,
          initialRoute: '/Home',
          routes: {
            '/Home': (context) => CustomPage(pageName: "Home"),
            '/About': (context) => CustomPage(pageName: "About"),
            '/Technical Notes': (context) =>
                CustomPage(pageName: "Technical Notes"),
            '/Projects': (context) => CustomPage(pageName: "Projects"),
            '/Achievements': (context) => CustomPage(pageName: "Achievements"),
          }),
    );
  }
}
