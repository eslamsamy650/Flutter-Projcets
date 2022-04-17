import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_07/add.dart';
import 'package:project_07/readex.dart';
import 'package:project_07/remove.dart';

class ViewProducts extends StatefulWidget {
  ViewProducts({Key? key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  final database = FirebaseFirestore.instance.collection('Products').snapshots();

 
  

  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
             print(database);
            return Center(
              child: CircularProgressIndicator(),
             
            );
          }
          

          return GridView(
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: snapshot.data!.docs.map(( DocumentSnapshot document) {
              return Center(
                child:Card(
                  clipBehavior: Clip.antiAlias,
                 child: Expanded(
                   flex: 5,
                   child: Column(
                     
                     children: [
                       ListTile(
                        title:Text('Name :  '+(document.data()! as Map<String, dynamic>)['name']),
                        subtitle: Text('Price :  '+(document.data()! as Map<String, dynamic>)['price'].toString()),
                        leading: CircleAvatar(
                          child: Image.network(
                            (document.data()! as Map<String, dynamic>)['image'],
                          ),
                 
                        ),
                        
                        

                                 ),
                                 Expanded(
                                   flex: 5,
                                   child: Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Text(
                                                       (document.data()! as Map<String, dynamic>)['Description'],
                                                       style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                                     ),
                                   ),
                                 ),
                                 ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      
                      TextButton(
                        style:TextButton.styleFrom(
                          primary:  Colors.blue
                        ),
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>  Add()));
                        },
                        
                        child: const Text('ADD '),
                      ),
                      TextButton(
                        // textColor: const Color(0xFF6200EE),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => remove()));
                        },
                        child: const Text('Remove'),
                      ),
                                 
                 
                     ],
                   ),
                                 
                      ] ),
                 )

              ));
            }).toList(),
          );
        },
      ),
    );
  }
}
