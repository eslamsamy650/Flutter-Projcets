import 'package:flutter/material.dart';
import 'body.dart';

class MostSoldScreen extends StatelessWidget {
  static String routeName = "/electronics";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MostSold'),
        ),
        body: Body());
  }
}
