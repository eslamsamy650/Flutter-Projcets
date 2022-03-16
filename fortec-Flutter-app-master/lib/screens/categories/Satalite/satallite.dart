import 'package:flutter/material.dart';
import 'body.dart';

class SatalliteScreen extends StatelessWidget {
  static String routeName = "/satallite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Satallite'),
        ),
        body: Body());
  }
}
