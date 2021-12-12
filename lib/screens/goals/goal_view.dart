import 'package:flutter/material.dart';
import 'package:save/models/goal.dart';
import 'package:save/screens/home/home.dart';

class GoalView extends StatefulWidget {
  final Goal goal;
  GoalView({this.goal});
  @override
  State<GoalView> createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(height: 40.0),
            // Row with Page title
            Row(
              children: <Widget>[
                Text('Goal Progress: ',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black)),
                Text(widget.goal.title,
                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ],
            ),
            SizedBox(height: 40.0),
            // Rows with Page content
            Row(
              children: <Widget>[
                Text('Goal Category : ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                SizedBox(width: 30.0),
                Text(widget.goal.category,
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                Text('Saving Goal : ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                SizedBox(width: 70.0),
                Text((widget.goal.goal.toString() + ' Rwf'),
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),

            SizedBox(height: 30.0),

            Divider(
              height: 10,
              thickness: 1,
              indent: 55,
              endIndent: 55,
              color: Colors.grey,
            ),

            SizedBox(height: 30.0),

            Row(
              children: <Widget>[
                Text('Start Date: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                SizedBox(width: 90.0),
                Text('Nov 11th 2021',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                Text('End Date: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                SizedBox(width: 100.0),
                Text('Nov 11th 2022',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
            SizedBox(height: 30.0),

            Divider(
              height: 10,
              thickness: 1,
              indent: 55,
              endIndent: 55,
              color: Colors.grey,
            ),

            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Text('Current Balance: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                SizedBox(width: 30.0),
                Text(widget.goal.currentBalance.toString() + ' Rwf',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
