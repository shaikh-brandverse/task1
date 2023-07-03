import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateToRemovingAll(context, Widget widget) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
            (Route<dynamic> route) => false);
  }

  static void navigatorPush(context, Widget widget) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (BuildContext context) => widget),
    //     (Route<dynamic> route) => false);
  }

  ///    Navigator.push(context, MaterialPageRoute(builder: (context) {
  // return const DetailScreen();
  // }));

  static void navigateTo(BuildContext context, Widget widget) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void navigateReplacement(BuildContext context, Widget widget) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static  navigatorPop(BuildContext context) async {
    Navigator.pop(context);
  }
}