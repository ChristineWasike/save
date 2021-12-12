import 'package:flutter/material.dart';
import 'package:save/models/goal.dart';
import 'package:save/screens/goals/goal_view.dart';

class GoalTile extends StatelessWidget {
  final Goal goal;
  GoalTile({this.goal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => GoalView(goal: goal))),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.yellow[goal.goal],
            ),
            title: Text(goal.title),
            subtitle: Text(
              goal.category,
            ),
          ),
        ),
      ),
    );
  }
}
