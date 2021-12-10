import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save/models/account.dart';

class GoalList extends StatefulWidget {
  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<List<Account>>(context);
    // print(accounts.documents);

    accounts.forEach((account) {
      print(account.firstName);
      print(account.lastName);
      print(account.accountBalance);
    });

    return Container();
  }
}
