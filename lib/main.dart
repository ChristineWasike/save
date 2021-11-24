// ignore_for_file: prefer_const_constructors
 
import 'package:flutter/material.dart';
import 'package:save/screens/auth-screens/signin.dart';
 
void main() => runApp(SaveApp());
 
class SaveApp extends StatelessWidget { 
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
 

