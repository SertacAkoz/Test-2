import 'package:flutter/cupertino.dart';
import 'package:test_2/home_page/home_view.dart';

class RouteGenerator {
  static Route<dynamic>? _routeOlustur(
    Widget gidilecekWidget,
    RouteSettings settings,
  ) {
    CupertinoPageRoute(
        settings: settings, builder: (context) => gidilecekWidget);
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeOlustur(const HomeView(), settings);
      default:
        return _routeOlustur(const HomeView(), settings);
    }
  }
}
