import 'package:flutter/material.dart';
import 'package:save/screens/authenticate/registar.dart';
import 'package:save/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),   
    );
  }
}