
import 'package:flutter/material.dart';

class PageOneScreen extends StatefulWidget {

  PageOneScreen({Key key}) : super(key: key);

  @override
  _PageOneScreenState createState() => new _PageOneScreenState();
}

class _PageOneScreenState extends State<PageOneScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("titre"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Page one"),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/PageTwo'),
                  child: Text("Page suivante")
              )
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}