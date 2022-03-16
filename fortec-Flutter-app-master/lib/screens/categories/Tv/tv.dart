import 'package:flutter/material.dart';
import './body.dart';

class TvScreen extends StatelessWidget {
  static String routeName = "/tv";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TVs'),
        ),
        body: Body());
  }
}
