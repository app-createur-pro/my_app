
import 'package:flutter/material.dart';
import 'package:my_app/providers/authentication_provider.dart';
import 'package:my_app/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final _authenticationProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_authenticationProvider.isConnected ? "Vous êtes connecté" : "Vous n'êtes pas connecté"),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: () {

                    if(_authenticationProvider.isConnected) {
                      _authenticationProvider.disconnect();
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()
                          )
                      );
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    primary: _authenticationProvider.isConnected ? Colors.red : Colors.blue
                  ),
                  child: Text(_authenticationProvider.isConnected ? "Se deconnecter" : "Se connecter")
              ),
            ],
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}