import 'package:flutter/material.dart';

class HomeViewModel {
  String? textFieldValue;

  void setTextFieldValue(String value) => textFieldValue = value;

  TextEditingController textEditingController = TextEditingController();
}
