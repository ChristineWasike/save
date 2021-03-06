import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save/models/user.dart';
// import 'package:save/screens/home/home.dart';
// import 'package:save/screens/authenticate/authenticate.dart';
import 'package:save/screens/onboarding/onboard.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either home or authenticate widget

    if (user == null) {
      return MainPage();
    } else {
      // Change to the setup pin/enter pin
      return Home();
    }
  }
}
