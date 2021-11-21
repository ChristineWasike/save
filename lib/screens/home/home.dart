import 'package:flutter/material.dart';
import 'package:save/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Save'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _auth.signOut();
              }),
        ],
      ),
    );
  }
}
