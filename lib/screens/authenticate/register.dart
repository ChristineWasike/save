import 'package:flutter/material.dart';
import 'package:save/services/auth.dart';
import 'package:save/shared/constants.dart';
import 'package:save/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[300],
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text('Sign up',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.brown[600])),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'First name'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your first name' : null,
                      onChanged: (val) {
                        setState(() => firstName = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Last name'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your last name' : null,
                      onChanged: (val) {
                        setState(() => firstName = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.brown[700],
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    firstName, lastName, email, password);
                            if (result == null) {
                              setState(() {
                                error = 'please supply a valid email';
                                loading = false;
                              });
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
                    SizedBox(height: 20.0),
                    TextButton.icon(
                      icon: Icon(Icons.person),
                      label: Text("Sign in"),
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
