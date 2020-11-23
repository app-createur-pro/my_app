import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Titre'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.orange],
                stops: [0.0, 0.7]
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(-3, -3),
                  blurRadius: 7
               )
              ],
              color: Colors.purple,
              border: Border.all(
                color: Colors.green,
                width: 15,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        )
    );
  }
}
