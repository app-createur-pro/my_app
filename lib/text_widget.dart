import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  final String text;

  const TextWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build method called in text");
    return Text(
      text,
      style: Theme.of(context).textTheme.display1,
    );
  }
}
