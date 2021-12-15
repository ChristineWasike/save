import 'package:flutter/material.dart';
import 'package:save/screens/goals/add_goal.dart';

class GoalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddGoal()));
        },
        textColor: Colors.white,
        color: Colors.amber[600],
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
      ),
    );
  }
}
