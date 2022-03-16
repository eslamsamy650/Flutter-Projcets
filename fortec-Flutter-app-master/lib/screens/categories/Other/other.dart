import 'package:flutter/material.dart';
import 'body.dart';

class OtherScreen extends StatelessWidget {
  static String routeName = "/other";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Others'),
        ),
        body: Body());
  }
}
