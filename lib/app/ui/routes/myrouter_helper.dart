import 'package:flutter/material.dart';

extension MyRouterHelper on BuildContext {
  Future<T?> push<T extends Object?>(String path, {Object? args}) =>
      Navigator.of(this).pushNamed(path, arguments: args);

  Future<T?> replace<T extends Object?>(String path, {Object? args}) =>
      Navigator.of(this).pushReplacementNamed(path, arguments: args);

  void pop<T extends Object?>({Object? result}) =>
      Navigator.of(this).pop(result);

  void maybePop<T extends Object?>({Object? result}) =>
      Navigator.of(this).maybePop(result);

  void popAllAndPush<T extends Object?>(String path, {Object? args}) =>
      Navigator.of(this)
          .pushNamedAndRemoveUntil(path, (route) => false, arguments: args);

  Future<T?> pushFromBottom<T extends Object?>(Widget page, {Object? args}) {
    final pageRoute = PageRouteBuilder<T>(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (_, animation, secondaryAnimation) => page,
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeOutCubic;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });

    return Navigator.of(this).push(pageRoute);
  }
}
