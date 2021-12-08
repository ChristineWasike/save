import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
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
