import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save/models/goal.dart';
import 'package:save/models/user.dart';
import 'package:save/screens/goals/goal_view.dart';
import 'package:save/screens/home/home.dart';
import 'package:save/services/database.dart';
import 'package:provider/provider.dart';

class UpdateGoal extends StatefulWidget {
  final Goal goal;
  UpdateGoal({this.goal});

  @override
  State<UpdateGoal> createState() => _UpdateGoalState();
}

class _UpdateGoalState extends State<UpdateGoal> {
  String _categoryValue;
  // String _frequencyValue;
  List<String> categories = ['School', 'Tech', 'Car', 'Piggy Bank', 'Other'];
  List<String> frequencies = ['Bi-weekly', 'Monthly'];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _goalController = new TextEditingController();
  final TextEditingController _amountController = new TextEditingController();
  final TextEditingController _frequencyController =
      new TextEditingController();
  final TextEditingController _currentBalanceController =
      new TextEditingController();
  var _currentSelectedValue;

  @override
  void initState() {
    _categoryValue = widget.goal.category;
    _titleController.text = widget.goal.title;
    _goalController.text = widget.goal.goal.toString();
    _frequencyController.text = widget.goal.frequency;
    _amountController.text = widget.goal.amount.toString();
    _currentBalanceController.text = widget.goal.currentBalance.toString();
    return super.initState();
  }

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
            onPressed: () {
              Navigator.pop(
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
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _categoryValue,
                        isDense: true,
                        onChanged: (val) =>
                            setState(() => _categoryValue = val),
                        items: categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Title
                  TextField(
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
                    controller: _titleController,
                    // onChanged: (val) {
                    //   setState(() => title = val);
                    // },
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  // Goal
                  TextField(
                    controller: _goalController,
                    decoration: InputDecoration(
                      labelText: 'Saving Goal (Rwf)',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16.0,
                      ),
                      hintText: 'Please enter a saving goal',
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber[700]),
                      ),
                    ),
                    // onChanged: (val) {
                    //   setState(() => goal = int.parse(val));
                    // },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
                            // frequency = newValue;
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

                  TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: 'How much will you save (Rwf)',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber[700]),
                      ),
                    ),
                    // onChanged: (val) {
                    //   setState(() => amount = int.parse(val));
                    // },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
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
                            'Add Goal',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        onPressed: () async {
                          // DatabaseService(uid: user.uid).createGoal(
                          //     _categoryValue,
                          //     title,
                          //     goal,
                          //     frequency,
                          //     amount,
                          //     currentBalance);
                          // Navigator.pop(context,
                          //     MaterialPageRoute(builder: (context) => Home()));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildDropDown(List listItem, String dropDownValue) {
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
