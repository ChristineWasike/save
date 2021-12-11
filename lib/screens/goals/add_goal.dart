import 'package:flutter/material.dart';
import 'package:save/screens/goals/goal_view.dart';
import 'package:save/screens/home/home.dart';

class AddGoal extends StatefulWidget {
  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  String dropDownValue;
  List categories = ["School", "Technology Device", "Car", "Piggy Bank"];
  List frequencyList = ["Bi-weekly", "Monthly"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Add new Goal",
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                buildDropDown(categories),
                SizedBox(height: 20.0),
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
                ),
                SizedBox(height: 20.0),
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
                ),
                SizedBox(height: 20.0),
                buildDropDown(categories),
                SizedBox(height: 20.0),
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
                ),
                SizedBox(height: 40.0),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoalView()));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildDropDown(List listItem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: DropdownButton(
          hint: Text("Select: "),
          dropdownColor: Colors.grey[100],
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey,
            fontSize: 18,
          ),
          value: dropDownValue,
          onChanged: (newValue) {
            setState(() {
              dropDownValue = newValue;
            });
          },
          items: listItem.map((valueItem) {
            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
          }).toList(),
        ),
      ),
    );
  }
}
