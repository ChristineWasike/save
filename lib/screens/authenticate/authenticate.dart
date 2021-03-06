import 'package:flutter/material.dart';
import 'package:save/screens/authenticate/register.dart';
import 'package:save/screens/authenticate/signin.dart';
// import '../onboarding/onboard.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  // Deciding on whether to display Sign In or SignUp
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Container(
        child: SignIn(toggleView: toggleView),
      );
    } else {
      return Container(
        child: Register(toggleView: toggleView)
        // child: Register(toggleView: toggleView),
      );
    }
  }
}
