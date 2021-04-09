
import 'package:flutter/material.dart';
import 'package:my_app/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final _authenticationProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'le champs ne peut pas être vide';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _authenticationProvider.connect();
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue
                  ),
                  child: Text("Se connecter")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
