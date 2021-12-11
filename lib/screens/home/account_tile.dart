import 'package:flutter/material.dart';
import 'package:save/models/account.dart';

class AccountTile extends StatelessWidget {
  final Account account;
  AccountTile({this.account});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.yellow[account.accountBalance],
          ),
          title: Text(account.firstName),
          subtitle: Text(
            account.accountBalance.toString(),
          ),
        ),
      ),
    );
  }
}
