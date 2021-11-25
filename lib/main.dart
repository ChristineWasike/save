// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:save/screens/auth-screens/signin-ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the app

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saving App',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
