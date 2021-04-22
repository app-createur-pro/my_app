
import 'package:flutter/material.dart';

class PageTwoScreen extends StatelessWidget {

  final String text;

  const PageTwoScreen({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Page two"),
      ),
    );

  }
}
