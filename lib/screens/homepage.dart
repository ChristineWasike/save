import 'package:flutter/material.dart';
 
class HomePage extends StatelessWidget {
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     body: Container(
       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
       child: Text("HOME PAGE"),
     ),
   );
 }
}
 
 
