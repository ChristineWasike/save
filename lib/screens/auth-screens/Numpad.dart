import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  double buttonSize = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          // add padding or margin
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your pin number',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  padButton('1'),
                  padButton('1'),
                  padButton('1'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  padButton('1'),
                  padButton('1'),
                  padButton('1'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  padButton('1'),
                  padButton('1'),
                  padButton('1'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  padButton('1'),
                  padButton('1'),
                  padButton('1'),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
  padButton(String buttonText){
    return Container(
      height: buttonSize,
      width: buttonSize,
      child: RaisedButton(
        color: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonSize/2),
        ),
        focusColor: Colors.grey,
        hoverColor: Colors.amber[700],
        highlightColor: Colors.amber[700],
        onPressed: (){},
        child: Center(
          child: Text(buttonText, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 25),),
        ),
      ),
    );
  }
  deleteButtonWidget(IconData icon, Function function){
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: Colors.amber[700],
          shape: BoxShape.circle
        ),
        child: Center(
          child: Icon(icon,
            size: 30,
            color: Colors.white,),
        ),
      ),
    );
  }
}

