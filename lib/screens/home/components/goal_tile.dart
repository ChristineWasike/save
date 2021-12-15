import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save/models/goal.dart';
import 'package:save/models/user.dart';
import 'package:save/screens/goals/goal_update.dart';
import 'package:save/screens/goals/goal_view.dart';
import 'package:save/services/database.dart';

class GoalTile extends StatefulWidget {
  final Goal goal;
  GoalTile({this.goal});
  @override
  _GoalTileState createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> {
  int _value;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GoalView(goal: widget.goal))),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 6.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              // backgroundColor: Colors.amber[600][goal.goal],
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/dollar.png'),
            ),
            title: Text(widget.goal.title),
            subtitle: Text(
              widget.goal.category,
            ),
            trailing: PopupMenuButton(
              color: Colors.grey[300],
              icon: Icon(Icons.more_vert, color: Colors.grey),
              onSelected: (value) {
                setState(() {
                  _value = value;
                });
                if (value == 1) {
                  print("Update goal");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateGoal(goal: widget.goal)));
                } else {
                  print("Deleted goal");
                  DatabaseService(uid: user.uid).deleteGoal(widget.goal.goalId);
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Update"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Delete"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
