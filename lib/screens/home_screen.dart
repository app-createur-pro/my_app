
import 'package:flutter/material.dart';
import 'package:my_app/my_textfield.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  bool _displayFirst = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(_displayFirst)
            MyTextField(key: UniqueKey()),
            MyTextField(key: UniqueKey())
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: () {
          setState(() {
            _displayFirst = !_displayFirst;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}