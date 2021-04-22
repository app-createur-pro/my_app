
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/resources/constants.dart';
import 'package:my_app/screens/page_one_screen.dart';
import 'package:my_app/screens/page_two_screen.dart';
import 'package:my_app/screens/unknown_Page_screen.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String _text = settings.arguments as String;
    switch (settings.name) {
      case PAGE_ONE: return MaterialPageRoute(builder: (_) => PageOneScreen());
      case PAGE_TWO: return MaterialPageRoute(builder: (_) => PageTwoScreen(text: _text,));
      default: return MaterialPageRoute(builder: (_) => UnknownPageScreen());
    }
  }

}