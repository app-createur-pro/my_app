
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {

  bool isConnected = false;

  //Events

  void connect() {
    isConnected = true;
    notifyListeners();
  }

  void disconnect() {
    isConnected = false;
    notifyListeners();
  }

}