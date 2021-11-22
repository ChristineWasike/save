// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
 
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:save/screens/auth-screens/signin.dart';
 
class LandingPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
       child: Container(
         width: 400,
         height: 600,
         decoration: BoxDecoration(
           color: Colors.grey,
           borderRadius: BorderRadius.circular(20),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             SizedBox(
               height: 60,
             ),
             Text(
               "Welcome!",
               textAlign: TextAlign.center,
               style: TextStyle(
                   color: Colors.amber[700],
                   fontWeight: FontWeight.w600,
                   fontSize: 30,
                   letterSpacing: 5),
             ),
             SizedBox(
               height: 40,
             ),
             Text(
               "Let's get started!",
               style: TextStyle(
                 color: Colors.grey,
                 fontSize: 12,
                 letterSpacing: 0.5,
               ),
             ),
             SizedBox(
               height: 70,
             ),
             // Sign In
             SizedBox(
               width: 200,
               height: 35,
               child: RaisedButton(
                 onPressed: () {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SignIn()));
                 },
                 textColor: Colors.white,
                 color: Colors.amber[700],
                 padding: const EdgeInsets.all(0.0),
                 elevation: 5.0,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15),
                 ),
                 child: Container(
                   padding: const EdgeInsets.all(8.0),
                   child: const Text(
                     "Sign In",
                     style: TextStyle(fontSize: 12),
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 8,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.symmetric(vertical: 10.0),
                   child: Container(
                     child: InkWell(
                       child: Text(
                         'Create an account',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.amber[700],
                             decoration: TextDecoration.underline),
                       ),
                     ),
                   ),
                 )
               ],
             ),
           ],
         ),
       ),
     ),
   );
 }
}
 
 

