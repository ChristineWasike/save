// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

class PinPad extends StatelessWidget {
  double buttonSize = 70.0;
  final Function(int) onNumberSelected;

  PinPad({this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNum(1),
                buildNum(2),
                buildNum(3),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNum(4),
                buildNum(5),
                buildNum(6),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNum(7),
                buildNum(8),
                buildNum(9),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildEmpty(),
                buildNum(0),
                buildIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNum(int num) {
    return Container(
      height: buttonSize,
      width: buttonSize,
      child: FlatButton(
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonSize / 2),
        ),
        onPressed: () {
          onNumberSelected(num);
        },
        child: Center(
          child: Text(
            num.toString(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmpty() {
    return Expanded(child: Container());
  }

  Widget buildIcon() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.backspace,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
