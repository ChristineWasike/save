import 'package:flutter/material.dart';
import 'package:save/screens/wrapper.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.network('https://unsplash.com/photos/ACWCQs6KXcw'),
        title: 'Dummy Text',
        body: 'Hello',
        footer: Text('Hello again!'),
      ),
      PageViewModel(
        image: Image.network('https://unsplash.com/photos/ACWCQs6KXcw'),
        title: 'Dummy Text',
        body: 'Hello',
        footer: Text('Hello again!'),
      ),
      PageViewModel(
        image: Image.network('https://unsplash.com/photos/ACWCQs6KXcw'),
        title: 'Dummy Text',
        body: 'Hello',
        footer: Text('Hello again!'),
      ),
    ];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onDone: () {},
          pages: getPages(),
          globalBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
