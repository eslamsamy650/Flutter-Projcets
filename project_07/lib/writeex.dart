import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_07/readex.dart';

class WriteExamples extends StatefulWidget {
  WriteExamples({Key? key}) : super(key: key);

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  void _subbutton() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ReadExample()));
       
      
             
    });
  }
  var nameControllor = new TextEditingController();
  var ageControllor = new TextEditingController();
  var cityControllor = new TextEditingController();

  final database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Add User'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text('Insert Your Data'),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: nameControllor,
                decoration: InputDecoration(labelText: 'Name' ,border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
               TextFormField(
                 keyboardType: TextInputType.number,
                 controller: ageControllor,
                decoration: InputDecoration(labelText: 'age' ,border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
               TextFormField(
                 controller: cityControllor,
                decoration: InputDecoration(labelText: 'City' ,border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed: () {
                if (nameControllor.text.isNotEmpty && ageControllor.text.isNotEmpty && cityControllor.text.isNotEmpty) {
                  insertData(nameControllor.text, ageControllor.text, cityControllor.text);
                  _subbutton();
                } else {
                }
              }, child: Text('ADD',style: TextStyle(fontSize: 20),))
              
              
            ],
          ),
        ),
      ),
    );
    
  }
  void insertData(String name , String age , String city){
  String? key = database.child('USERS').push().key;
  database.child("USERS").child(key!).set({
    'id':key,
    'name':name,
    'age':age,
    'city':city,

  });
  nameControllor.clear();
  ageControllor.clear();
  cityControllor.clear();
      
    }

}