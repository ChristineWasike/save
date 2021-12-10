import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class GoalList extends StatefulWidget {
  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<QuerySnapshot>(context);
    // print(accounts.documents);

    for (var doc in accounts.documents) {
      print(doc.data);
    }

    return Container();
  }
}
