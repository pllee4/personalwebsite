import 'package:flutter/material.dart';

class ResponsiveWidget {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1000;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000 &&
        MediaQuery.of(context).size.width < 1200;
  }
}
