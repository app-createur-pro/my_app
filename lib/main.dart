import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cupertino',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool activate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App LifeCycle"),
      ),
      body: (Platform.isAndroid)
        ? Switch(
        value: activate,
        onChanged: (value) {
          setState(() {
            activate = value;
          });
        })
        : CupertinoSwitch(
        value: activate,
        onChanged: (value) {
          setState(() {
            activate = value;
          });
      },
      )
    );
  }
}
