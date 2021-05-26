import 'package:flutter/material.dart';

class NavigatorHelper {
  static Future<dynamic> push(BuildContext context, dynamic route) {
    return Navigator.of(context).push(_createRoute(context, route));
  }

  static void pushReplacement(BuildContext context, dynamic route) {
    Navigator.of(context).pushReplacement(_createRoute(context, route));
  }

  static void pushAndRemoveUntil(BuildContext context, dynamic route) {
    Navigator.of(context).pushAndRemoveUntil(
      _createRoute(context, route),
      (Route<dynamic> route) => false,
    );
  }

  static Route _createRoute(BuildContext context, dynamic route) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => route,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}
