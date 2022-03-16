import 'package:flutter/material.dart';
import 'body.dart';

class NetworkScreen extends StatelessWidget {
  static String routeName = "/network";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Network'),
        ),
        body: Body());
  }
}
