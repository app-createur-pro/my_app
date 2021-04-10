import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/providers/authentication_provider.dart';
import 'package:my_app/providers/premium_provider.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => PremiumProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomeScreen(title: 'Accueil'),
      ),
    );
  }
}


