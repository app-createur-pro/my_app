
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {

  final UniqueKey key;

  const MyTextField({this.key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}