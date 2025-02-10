import 'package:flutter/material.dart';
import 'package:go_app/app/ui/screens/home/home_screen.dart';

class MyRouterGenerator {
  final navigatorKey = GlobalKey<NavigatorState>();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
