import 'package:flutter/material.dart';
import 'package:save/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either home or authenticate widget
    return Home();
  }
}
