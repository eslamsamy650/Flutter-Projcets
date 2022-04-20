import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
  
}

class _homeState extends State<home> {
  bool loginButton = true;
  bool logoutButton = true;
  late TextEditingController nameControllor ;
  final database = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    nameControllor = new TextEditingController();
     nameControllor.addListener(() {
      final loginButton = nameControllor.text.isNotEmpty;
      setState(() {
        this.loginButton=loginButton;
        logoutButton=false;
      });
      
    });
  }

  @override
  void dispose() {
    nameControllor.dispose();
    super.dispose();
  }
   
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title:  Text('Time Sheet'),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text('Insert Your Name'),
               SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: nameControllor,
                
                decoration: InputDecoration(labelText: 'Name' ,border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
               ElevatedButton(onPressed: loginButton
               ?  () {
                 insertData(nameControllor.text);
                 setState(() {
                   loginButton=false;
                   logoutButton=true;
                 });
               }
                :null,
                 child: Text('LogIn',style: TextStyle(fontSize: 20),)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: 
              logoutButton
               ?  () {
                 print(nameControllor);
                 setState(() {
                   loginButton=true;
                   logoutButton=false;
                 });
               }
                :null,
               child: Text('LogOut',style: TextStyle(fontSize: 20),))
              
            ],
          ),
        ),
      ),
    );
  }
   void insertData(String name ){
  String? key = database.child('Users').push().key;
  database.child("Users").child(key!).set({
    'id':key,
    'name':name,
    

  });
  nameControllor.clear();
  
      
    }


}
