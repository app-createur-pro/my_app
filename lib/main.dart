import 'package:flutter/material.dart';
import 'package:my_app/screens/page_one_screen.dart';
import 'package:my_app/screens/page_two_screen.dart';
import 'package:my_app/screens/unknown_Page_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/' : (context) => PageOneScreen(),
          '/PageTwo' : (context) => PageTwoScreen(),
        },
        initialRoute: '/',
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (context) {
                return UnknownPageScreen();
              }
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        //home: PageOneScreen(title: 'Accueil'),
      );
  }
}


