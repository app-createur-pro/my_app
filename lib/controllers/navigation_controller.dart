
import 'package:flutter/material.dart';

class NavigationController {

  Map<Widget, Function> appBarIcons;
  
  NavigationController.appBar() {
    appBarIcons = {
      Icon(Icons.add): _clickAddButton,
      Icon(Icons.camera): _clickCameraButton,
      Icon(Icons.refresh): _clickRefreshButton,
      Icon(Icons.remove): _clickRemoveButton
    };
  }

  void _clickAddButton() {
    print("click sur add button");
  }

  void _clickCameraButton() {
    print("click sur camera button");
  }

  void _clickRefreshButton() {
    print("click sur refresh button");

  }

  void _clickRemoveButton() {
    print("click sur remove button");
  }
  
}