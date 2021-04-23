
import 'package:flutter/material.dart';
import 'package:my_app/utils/route_generator.dart';

class PageOneScreen extends StatefulWidget {

  PageOneScreen({Key key}) : super(key: key);

  @override
  _PageOneScreenState createState() => new _PageOneScreenState();
}

class _PageOneScreenState extends State<PageOneScreen> {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("titre"),
        ),
        backgroundColor: Colors.green[100],
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text("Page one"),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, PAGE_TWO, arguments: "du texte"),
                    child: Text("Page suivante")
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, PAGE_ONE),
                    child: Text("Ouvrir la page actuelle")
                ),
              ],
            )
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}