import 'package:flutter/material.dart';
import 'package:save/screens/goals/add_goal.dart';
import 'package:save/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Save'),
        backgroundColor: Colors.amber[500],
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _auth.signOut();
              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddGoal()));
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
                    'Add New Goal',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
