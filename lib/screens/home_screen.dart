import 'package:flutter/material.dart';
import 'package:my_app/controllers/navigation_controller.dart';
import 'package:my_app/screens/second_screen.dart';
import 'package:my_app/widgets/app_bar_widget.dart';
import 'package:my_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:my_app/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NavigationController _appBarController;
  NavigationController _bottomBarController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _appBarController = NavigationController.appBar(scaffoldKey: _scaffoldKey);
    _bottomBarController = NavigationController.bottomBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(appBarController: _appBarController),
      drawer: DrawerWidget(),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("text")
            ],
          )
      ), //
      bottomNavigationBar: BottomNavigationBarWidget(bottomBarController: _bottomBarController,),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
