import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save/models/account.dart';
import 'package:save/screens/home/account_tile.dart';

class GoalList extends StatefulWidget {
  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<List<Account>>(context);

    //   accounts.forEach((account) {
    //     print(account.firstName);
    //     print(account.lastName);
    //     print(account.accountBalance);
    //   });

    //   print(accounts.length);
    //   return Container();
    // }

  print(accounts.length);
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        return AccountTile(account: accounts[index]);
      },
    );
  }
}
