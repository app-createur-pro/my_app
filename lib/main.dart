import 'package:flutter/material.dart';
import 'package:my_app/text_field_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _count = 0;

  _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  _changeCounter(int value) {
    setState(() {
      _count = value;
    });
  }

  String _displayCountChangeText() {
    return "Counter changed to $_count";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Callback"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_count.toString()),
          ButtonsWidget(
            incrementCallback: _incrementCounter,
            increment: _incrementCounter,
            changeNumber: (value) => _changeCounter(value),
            onChanged: (value) => _changeCounter(value),
            onSet: (value) => _changeCounter(value),
            onGet: _displayCountChangeText,
          ),
        ],
      ),
    );
  }
}
