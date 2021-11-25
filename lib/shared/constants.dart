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
