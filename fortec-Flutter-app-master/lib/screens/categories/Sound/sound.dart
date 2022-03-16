import 'package:flutter/material.dart';
import 'body.dart';

class SoundScreen extends StatelessWidget {
  static String routeName = "/sound";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sounds'),
      ),
      body: Body(),
    );
  }
}
