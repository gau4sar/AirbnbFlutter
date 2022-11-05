import 'package:airbnb_flutter/screens/ExplorePage.dart';
import 'package:airbnb_flutter/screens/SearchPageWidget.dart';
import 'package:flutter/material.dart';

import 'RoutesName.dart';

class Routes {
  static MaterialPageRoute generateRoute(
      RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.explore:
        return MaterialPageRoute(
            builder: (BuildContext context) => ExplorePageWidget());

      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                SearchPageWidget());

     /* case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                SearchPageWidget());
*/
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => MaterialApp());
    }
  }
}
