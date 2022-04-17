import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class remove extends StatefulWidget {
  remove({Key? key}) : super(key: key);

  @override
  State<remove> createState() => _removeState();
}

class _removeState extends State<remove> {
  final database = FirebaseFirestore.instance.collection('Products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
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
              return  Center(
        child: Column(
             children: [ 
               Center(
                 child: Container(
                     
                   ),
               ),
               SizedBox(
                 height: 50,
               ),
               Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         CircleAvatar(
                          radius: 50,
                         backgroundImage: NetworkImage(   (document.data()! as Map<String, dynamic>)['image'],
                          ),
                 
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Name :  '+(document.data()! as Map<String, dynamic>)['name']),
                        
                        
                        
                      
                      ],
                    ),
                 ),
                     
               ],
             ),
           
         ],

        ),
      );
            }).toList(),
          );
        },
      ),
    );
  }
}