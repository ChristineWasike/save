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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Goal Category : ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                Text(widget.goal.category,
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Saving Goal : ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Start Date: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                Text('Nov 11th 2021',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('End Date: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Current Balance: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                Text(widget.goal.currentBalance.toString() + ' Rwf',
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
              ],
            ),

            SizedBox(height: 30.0),
            Container(
              width: 250,
              height: 40,
              child: RaisedButton(
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
                      'Deposit',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () {
                    depositDialog();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future depositDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Enter amount you want to save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.black,
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter amount you want to save: ',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber[700])),
            ),

            // TODO: This is what you use to collect the data https://www.youtube.com/watch?v=D6icsXS8NeA
            // controller: ,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.amber[700]),
              ),
            )
          ],
        ),
      );
}
