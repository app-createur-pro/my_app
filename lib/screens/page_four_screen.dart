
import 'package:flutter/material.dart';
import 'package:my_app/utils/route_generator.dart';

class PageFourScreen extends StatefulWidget {

  PageFourScreen({Key key}) : super(key: key);

  @override
  _PageFourScreenState createState() => new _PageFourScreenState();
}

class _PageFourScreenState extends State<PageFourScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("titre"),
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Page four"),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).popAndPushNamed(PAGE_ONE),
                  child: Text("close screen")
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      PAGE_ONE,
                      (Route<dynamic> route) => false
                      ),
                  child: Text("Ouvrir page 1")
              ),
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}