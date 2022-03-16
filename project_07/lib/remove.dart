import 'package:flutter/material.dart';

class remove extends StatefulWidget {
  remove({Key? key}) : super(key: key);

  @override
  State<remove> createState() => _removeState();
}

class _removeState extends State<remove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your Product was removed successfully'),
      ),
    );
  }
}