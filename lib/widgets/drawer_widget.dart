
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _safePadding = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: _safePadding),
        child: Column(
          children: [
            Text("Menu 1"),
            SizedBox(height: 20,),
            Text("Menu 2"),
          ],
        ),
      ),
    );
  }
}
