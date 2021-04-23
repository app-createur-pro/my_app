
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/page_four_screen.dart';
import 'package:my_app/screens/page_one_screen.dart';
import 'package:my_app/screens/page_three_screen.dart';
import 'package:my_app/screens/page_two_screen.dart';
import 'package:my_app/screens/unknown_Page_screen.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String _text = "texte par défaut";
    if(settings.arguments != null) {
     _text = settings.arguments as String;
    }
    switch(settings.name) {
      case PAGE_ONE : return MaterialPageRoute(builder: (_) => PageOneScreen());
      case PAGE_TWO : return MaterialPageRoute(builder: (_) => PageTwoScreen(text: _text,));
      case PAGE_THREE : return MaterialPageRoute(builder: (_) => PageThreeScreen());
      case PAGE_FOUR: return MaterialPageRoute(builder: (_) => PageFourScreen());

      default: return MaterialPageRoute(builder: (_) => UnknownPageScreen());
    }

  }

}

const String PAGE_ONE = "/";
const String PAGE_TWO = "/PageTwo";
const String PAGE_THREE = "/PageThree";
const String PAGE_FOUR = "/PageFour";