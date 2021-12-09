import 'package:flutter/material.dart';
import 'package:save/screens/goals/add_goal.dart';
import 'package:save/services/auth.dart';
import 'package:save/shared/constants.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemIndex = 1;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Save'),
        backgroundColor: Colors.amber[600],
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
      bottomNavigationBar: Row(
        children: <Widget>[
          buildBottomNavItem(Icons.home, 0, true),
          buildBottomNavItem(Icons.add_circle, 1, false),
          buildBottomNavItem(Icons.history, 2, false),
        ],
      ),
    );
  }

  Container buildBottomNavItem(IconData icon, int index, isActive) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: index == _selectedItemIndex ? Colors.amber : Colors.white,
      ),
      child: Icon(icon),
    );
  }
}
