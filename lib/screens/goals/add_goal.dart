import 'package:flutter/material.dart';
import 'package:save/screens/goals/goal_view.dart';
import 'package:save/screens/home/home.dart';

class AddGoal extends StatefulWidget {
  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  String _categoryValue;
  String _frequencyValue;
  List<String> categories = ['School', 'Tech Device', 'Car', 'Piggy Bank'];
  List<String> frequencies = ['Bi-weekly', 'Monthly'];
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
                  isEmpty: _categoryValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _categoryValue,
                      isDense: true,
                      onChanged: (val) => setState(() => _categoryValue = val),
                      items: categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // buildDropDown(categories, _categoryValue),
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

                InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Saving Frequency',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                    hintText: 'Please select a frequency',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber[700]),
                    ),
                  ),
                  isEmpty: _frequencyValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _frequencyValue,
                      isDense: true,
                      onChanged: (val) => setState(() => _frequencyValue = val),
                      items: frequencies.map((frequency) {
                        return DropdownMenuItem(
                          value: frequency,
                          child: Text(frequency),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // buildDropDown(frequencies, _frequencyValue),
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
