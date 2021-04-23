
import 'package:flutter/material.dart';
import 'package:my_app/utils/route_generator.dart';

class PageTwoScreen extends StatelessWidget {

  final String text;

  const PageTwoScreen({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor:Colors.purple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("close screen")
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(PAGE_THREE),
                child: Text("go to page three")
            ),
          ],
        ),
      ),
    );

  }
}
