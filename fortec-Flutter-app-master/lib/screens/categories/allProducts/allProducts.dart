import 'package:flutter/material.dart';
import 'body.dart';

class AllProducts extends StatelessWidget {
  static String routeName = "/allProducts";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Products'),
        ),
        body: Body());
  }
}
