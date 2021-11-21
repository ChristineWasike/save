import 'package:flutter/material.dart';
import 'package:save/screens/home/home.dart';
import 'package:save/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    return Authenticate();
  }
}
