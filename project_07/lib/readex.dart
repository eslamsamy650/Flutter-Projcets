import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ReadExample extends StatefulWidget {
  ReadExample({Key? key}) : super(key: key);

  @override
  State<ReadExample> createState() => _ReadExampleState();
}

class _ReadExampleState extends State<ReadExample> {
  
  final database = FirebaseDatabase.instance.ref().child("USERS");

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Read Examples'),),
      body: Center(child: FirebaseAnimatedList(query: database, itemBuilder: (BuildContext context , DataSnapshot snapshot, Animation<double>animation,int index, ){
        var a = snapshot.value as Map;
        return ListTile(
          subtitle: Text(a['city']+ "\t" +a['age']),
          title: Text(a['name']),
        );
      },),)
    );
  }
}