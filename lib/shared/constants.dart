import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(fontWeight: FontWeight.bold),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown, width: 2.0),
  ),
);

// Standard colors
const Color kPrimaryColor = Color(0xFFA000);
const Color kTextColor = Color(0xFF3C4046);
const Color kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

Color brightYellow = Color(0xFFC801);
Color yellowAmber = Colors.yellowAccent[700];
Color greyBlue = Color(0x385A65);
Color blueGrey = Colors.blue;
Color darkBlue = Color(0x1B2E35);
