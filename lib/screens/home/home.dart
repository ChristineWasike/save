import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
              onPressed: () {}),
        ],
      ),
    );
  }
}
