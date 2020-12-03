import 'package:flutter/material.dart';
import 'package:my_app/text_field_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

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

  _displayOnConsole() {
    print("Le bouton est appuyé");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_count.toString()),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ButtonsWidget(
                displayOnConsole: _displayOnConsole,
                increment: _incrementCounter,
                changeNumber: (value) {
                  setState(() {
                    _count = value;
                  });
                }
              ),
            ),
          ],
        )
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
