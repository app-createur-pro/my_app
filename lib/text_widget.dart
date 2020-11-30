import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  final int counter;

  const TextWidget({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build method called in text");
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.display1,
    );
  }
}
