
import 'package:flutter/material.dart';
import 'package:my_app/controllers/navigation_controller.dart';

class BottomNavigationBarWidget extends StatefulWidget {

  final NavigationController bottomBarController;

  const BottomNavigationBarWidget({Key key, @required this.bottomBarController}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          widget.bottomBarController.bottomBarIcons.values.toList()[index].call();
        },
        items: widget.bottomBarController.bottomBarIcons.entries.map(
                (entry) => BottomNavigationBarItem(
                icon: entry.key,
                label: ""
            )
        ).toList()
    );
  }
}
