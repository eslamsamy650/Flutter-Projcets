// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var questions = [
      'What\'s your favorite color ?',
      'What\'s your favorite color ?'
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("My Learning App"),
      ),
      body: Column(children: [
        // ignore: prefer_const_constructors
        Text('The Question!'),
        ElevatedButton(
            onPressed: () {
              // ignore: prefer_const_constructors
            },
            // ignore: prefer_const_constructors
            child: Text('Answer1')),
        ElevatedButton(
            onPressed: () {
              // ignore: prefer_const_constructors
            },
            // ignore: prefer_const_constructors
            child: Text('Answer2')),
        ElevatedButton(
            onPressed: () {
              // ignore: prefer_const_constructors
            },
            // ignore: prefer_const_constructors
            child: Text('Answer3')),
      ]),
    ));
  }
}
