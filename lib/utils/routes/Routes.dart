import 'package:flutter/material.dart';

import 'RoutesName.dart';

class Routes {
  static MaterialPageRoute generateRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => MaterialApp());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                MaterialApp());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => MaterialApp());
    }
  }
}
