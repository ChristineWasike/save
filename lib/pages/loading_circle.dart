import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
