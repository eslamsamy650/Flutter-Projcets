

import 'package:flutter/material.dart';

import 'secondscreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title:Text("Welcome our Customers"),
      ),
      body: 
      
      Center( 
        child:FloatingActionButton(
          child: Text('Press'),
          
          onPressed: () =>  {
            Navigator.push(context, MaterialPageRoute(builder:(context) =>  SecondScreen()))
          }
          
          ),
)
,
    );
  }
}