import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save/models/goal.dart';
import 'package:save/models/user.dart';
import 'package:save/screens/goals/goal_view.dart';
import 'package:save/screens/home/home.dart';
import 'package:save/services/database.dart';
import 'package:provider/provider.dart';

class AddGoal extends StatefulWidget {
  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  final _formKey = GlobalKey<FormState>();

  // Added the variables to collect the goal fields
  // String category = '';
  String title = '';
  int goal = 0;
  String frequency = 'bi-weekly';
  int amount = 0;
  int currentBalance = 0;

  final List<String> categories = ["Tech Devices", "School", "Piggy bank"];

  String _currentCategory;
  var _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return StreamProvider<List<Goal>>.value(
      value: DatabaseService().goals,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "Add a new Goal",
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),

                // Category Input Field
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Goal Category',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                    hintText: 'Please select a category',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[700]),
                    ),
                  ),
                  isEmpty: _currentSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _currentCategory,
                      isDense: true,
                      onChanged: (val) =>
                          setState(() => _currentCategory = val),
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Title
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Goal Title',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[700]),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() => title = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Goal
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Saving Goal',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[700]),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() => goal = int.parse(val));
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Frequency
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'How often will you save',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                    hintText: 'Please select how often will you save',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[700]),
                    ),
                  ),
                  isEmpty: _currentSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _currentSelectedValue,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          _currentSelectedValue = newValue;
                          frequency = newValue;
                        });
                      },
                      items: <String>["Bi-weekly", "Monthly"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // Amount per frequency
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'How much will you save',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[700]),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() => amount = int.parse(val));
                  },
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
                          'Add Goal',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      onPressed: () async {
                        DatabaseService(uid: user.uid).createGoal(
                            _currentCategory,
                            title,
                            goal,
                            frequency,
                            amount,
                            currentBalance);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
