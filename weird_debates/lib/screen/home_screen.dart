import 'package:flutter/material.dart';

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'QuizHome',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: Center(
          child: Text('퀴즈 홈 화면 Body'),
        ));
  }
}
