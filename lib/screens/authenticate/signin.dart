import 'package:flutter/material.dart';
import 'package:save/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // text field state
  String email = '';
  String password = '';

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
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.brown[700],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  }),
              SizedBox(height: 20.0),
              TextButton.icon(
                icon: Icon(Icons.person),
                label: Text("Register"),
                onPressed: () {
                  widget.toggleView();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
