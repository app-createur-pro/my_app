import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Titre'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Color>colors = [
    Colors.green,
    Colors.red,
    Colors.grey,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  void faireCeciSiPortrait(Orientation orientation) {
    //je vais enregistrer tel élément quelque part sans forcément toucher au design
  }

  @override
  Widget build(BuildContext context) {

    Orientation orientation = MediaQuery.of(context).orientation;
    faireCeciSiPortrait(orientation);

    return Scaffold(
        appBar: AppBar(),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              children: List.generate(colors.length, (index) =>
                  Container(
                    color: colors[index],
                  )
              ),
            );
          },
        )
    );
  }
}
