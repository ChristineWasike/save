import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SecurityPin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your pin number',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20,),
              Text(
                'Use your app pin to unlock the app\n and confirm transactions',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 30.0,),
              PinCodeTextField(
                appContext: context, 
                length: 4, 
                onChanged: (value){
                  print(value);
                },
                pinTheme: PinTheme(
                  inactiveColor: Colors.amber[700],
                  activeColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}