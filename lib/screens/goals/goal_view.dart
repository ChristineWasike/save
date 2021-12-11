import 'package:flutter/material.dart';
import 'package:save/screens/home/home.dart';

class GoalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Goal Overview",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
