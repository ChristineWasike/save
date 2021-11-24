import 'package:flutter/material.dart';
import 'package:save/screens/auth-screens/Numpad.dart';
import 'package:save/screens/auth-screens/signin.dart';
import 'package:save/screens/homepage.dart';
 
class SignUp extends StatelessWidget {
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
       resizeToAvoidBottomInset: false,
       body: Container(
         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
         // Container for sign in form
         child: Container(
           padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
           child: Column(
             children: <Widget>[
               // first text field "Name"
               TextField(
                 decoration: InputDecoration(
                     labelText: 'Name',
                     labelStyle: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.amber[700],
                     ),
                     focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white))),
               ),
               // create space between the textfields
               SizedBox(
                 height: 20.0,
               ),
               // first text field "Email"
               TextField(
                 decoration: InputDecoration(
                     labelText: 'Email',
                     labelStyle: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.amber[700],
                     ),
                     focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white))),
               ),
               // create space between the textfields
               SizedBox(
                 height: 20.0,
               ),
               // second text field "Password"
               TextField(
                 decoration: InputDecoration(
                     labelText: 'Password',
                     labelStyle: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.amber[700],
                     ),
                     focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white))),
                 obscureText: true,
               ),
               SizedBox(
                 height: 20.0,
               ),
               // second "Password"
               TextField(
                 decoration: InputDecoration(
                     labelText: 'Confirm Password',
                     labelStyle: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.amber[700],
                     ),
                     focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white))),
                 obscureText: true,
               ),
               SizedBox(
                 height: 20.0,
               ),
               // Sign up
               Container(
                 width: 250,
                 height: 35,
                 // ignore: deprecated_member_use
                 child: RaisedButton(
                   onPressed: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => NumPad()));
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
                       'Sign up',
                       style: TextStyle(fontSize: 12),
                     ),
                   ),
                 ),
               ),
 
               SizedBox(
                 height: 8,
               ),
 
               // create account
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Center(
                     child: TextButton(
                       onPressed: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => SignIn()));
                       },
                       child: Text(
                         'Already have an account',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: Colors.grey,
                             fontSize: 12.0,
                             fontWeight: FontWeight.normal),
                       ),
                     ),
                   ),
                   SizedBox(
                     width: 20,
                   ),
                 ],
               ),
             ],
           ),
         ),
       ));
 }
}
 
 

