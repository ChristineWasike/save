import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save/models/goal.dart';
import 'package:save/models/user.dart';
import 'package:save/screens/goals/goal_update.dart';
import 'package:save/screens/goals/goal_view.dart';
import 'package:save/services/database.dart';

class GoalTile extends StatelessWidget {
  final Goal goal;
  GoalTile({this.goal});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => GoalView(goal: goal))),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 6.0),
          child: ListTile(
              leading: CircleAvatar(
                radius: 20.0,
                // backgroundColor: Colors.yellow[goal.goal],
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/dollar.png'),
              ),
              title: Text(goal.title),
              subtitle: Text(
                goal.category,
              ),
              trailing: PopupMenuButton(
                color: Colors.grey[300],
                icon: Icon(Icons.more_vert, color: Colors.grey),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 1,
                    child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateGoal(goal: goal))),
                        child: Text("Update")),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: GestureDetector(
                        onTap: () {
                          DatabaseService(uid: user.uid)
                              .deleteGoal(goal.goalId);
                        },
                        child: Text("Delete")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
