import 'package:flutter/material.dart';
import 'package:my_app/screens/page_one_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: PageOneScreen(title: 'Accueil'),
      );
  }
}


