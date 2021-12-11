import 'package:flutter/material.dart';
import 'package:save/models/account.dart';
import 'package:save/models/user.dart';
import 'package:save/screens/home/home.dart';
import 'package:save/services/auth.dart';
import 'package:save/services/database.dart';
import 'package:provider/provider.dart';

class AddGoal extends StatefulWidget {
  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  final _formKey = GlobalKey<FormState>();
  String category = '';
  String password = '';
  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return StreamProvider<List<Account>>.value(
      value: DatabaseService().users,
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
                      value: _currentSelectedValue,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          _currentSelectedValue = newValue;
                        });
                      },
                      items: <String>["Tech Devices", "School", "Piggy bank"]
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
                SizedBox(
                  height: 20.0,
                ),
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
                SizedBox(
                  height: 20.0,
                ),
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
                        // DatabaseService(uid: user.uid).createGoal(category, title, goal, frequency, amount, currentBalance, amountDeposited);
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
