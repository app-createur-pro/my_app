
import 'package:flutter/material.dart';
import 'package:my_app/resources/constants.dart';

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
        title: Text("myapp"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Page one"),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, PAGE_TWO, arguments: 'Ceci est du texte'),
                  child: Text("Page suivante")
              )
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}