import 'package:flutter/material.dart';
import 'package:save/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text("Sign in to Save"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text("Sign in"),
          style: ElevatedButton.styleFrom(primary: Colors.brown[700],),
          onPressed: () async {
            print("Pressed");
            dynamic result = await _auth.signInAnonymously();
            if (result == null) {
              print('error signing in.');
            } else {
              print('signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
