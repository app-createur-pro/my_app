import 'package:flutter/material.dart';
import 'package:my_app/controllers/navigation_controller.dart';
import 'package:my_app/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NavigationController _appBarController;
  NavigationController _bottomBarController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _appBarController = NavigationController.appBar();
    _bottomBarController = NavigationController.bottomBar();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _appBarController.appBarIcons.entries.map(
                  (entry) => GestureDetector(
                    onTap: () => entry.value.call(),
                    child: entry.key,
                  )
          ).toList(),
        ),
        titleSpacing: 40,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("text")
            ],
          )
      ), //
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _bottomBarController.bottomBarIcons.values.toList()[index].call();
        },
        items: _bottomBarController.bottomBarIcons.entries.map(
                (entry) => BottomNavigationBarItem(
                    icon: entry.key,
                    label: ""
                )
        ).toList()
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
