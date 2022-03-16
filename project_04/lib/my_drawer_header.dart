import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top:20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(


            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
            ),
            
          ) ,
          Text("Welcome ", style: TextStyle(color: Colors.white, fontSize: 20),)

        ],
        
      ),
    );
  }
}