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
            trailing: DropDownMenuFb1(
              color: Colors.grey[300],
              icon: Icon(Icons.more_vert, color: Colors.grey),
              // onSelected: (){},
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownMenuFb1 extends StatefulWidget {
  // final List<PopupMenuEntry> menuList;
  final Color color;
  final Widget icon;
  // TODO: Fix onselected

  // var onSelected;
  
  const DropDownMenuFb1({
    // this.menuList,
    // this.onSelected,
    this.color = Colors.white,
    this.icon = const Icon(
      Icons.more_vert,
      color: Color(0xff4338CA),
    ),
  });

  @override
  _DropDownMenuFb1State createState() => _DropDownMenuFb1State();
}

class _DropDownMenuFb1State extends State<DropDownMenuFb1> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: widget.color,
      icon: widget.icon,
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: 1,
          child: Text("Update"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("Delete"),
        ),
      ],
    );
  }
}
