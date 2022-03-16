import 'package:flutter/material.dart';
import 'body.dart';

class SecurityScreen extends StatelessWidget {
  static String routeName = "/security";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Security'),
        ),
        body: Body());
  }
}
