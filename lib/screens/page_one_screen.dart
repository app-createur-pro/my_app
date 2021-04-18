
import 'package:flutter/material.dart';
import 'package:my_app/screens/page_two_screen.dart';

class PageOneScreen extends StatefulWidget {

  final String title;

  PageOneScreen({Key key, this.title}) : super(key: key);

  @override
  _PageOneScreenState createState() => new _PageOneScreenState();
}

class _PageOneScreenState extends State<PageOneScreen> {

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
             Text("Page One"),
             SizedBox(height: 10,),
             ElevatedButton(
                 onPressed: () => Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => PageTwoScreen()
                   )
                 ),
                 child: Text("Page suivante")
             )
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}