import 'package:flutter/material.dart';
import 'body.dart';

class AccessoriesScreen extends StatelessWidget {
  static String routeName = "/accessories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Accessories'),
        ),
        body: Body());
  }
}
