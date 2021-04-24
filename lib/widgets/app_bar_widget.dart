
import 'package:flutter/material.dart';
import 'package:my_app/controllers/navigation_controller.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {

  final NavigationController appBarController;
  @override
  final Size preferredSize;

  AppBarWidget({Key key, @required this.appBarController})
      : preferredSize = Size.fromHeight(50),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
            onTap: () => appBarController.drawerIcon.values.toList()[0].call(),
            child: appBarController.drawerIcon.keys.toList()[0]
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: appBarController.appBarIcons.entries.map(
                (entry) => GestureDetector(
              onTap: () => entry.value.call(),
              child: entry.key,
            )
        ).toList(),
      ),
      titleSpacing: 40,
      centerTitle: true,
    );
  }
}
