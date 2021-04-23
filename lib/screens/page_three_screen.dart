
import 'package:flutter/material.dart';
import 'package:my_app/utils/route_generator.dart';

class PageThreeScreen extends StatefulWidget {

  PageThreeScreen({Key key}) : super(key: key);

  @override
  _PageThreeScreenState createState() => new _PageThreeScreenState();
}

class _PageThreeScreenState extends State<PageThreeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("titre"),
      ),
      backgroundColor: Colors.orange[100],
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Page three"),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).popAndPushNamed(PAGE_ONE),
                  child: Text("close screen")
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, PAGE_FOUR, arguments: "du texte"),
                  child: Text("Page suivante")
              ),

            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}