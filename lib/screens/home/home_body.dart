import 'package:flutter/material.dart';
import 'package:save/screens/home/components/goal_list.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Hello"),
          GoalList(),
        ],
      ),
    );
  }
}
