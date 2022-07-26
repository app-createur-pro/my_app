import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(title: 'Buttons - Flutter2'),
    );
  }
}
