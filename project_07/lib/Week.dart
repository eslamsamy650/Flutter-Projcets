import 'package:flutter/material.dart';  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:project_07/Week.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
  

  
class week extends StatefulWidget {
    final String score ;

  const week({
    Key? key,
      required this.score, 
   }) : super(key: key);

  @override
  State<week> createState() => _weekState();
}
 
class _weekState extends State<week> {
    var Uid =  {'Samy':'Ar9k6kZPpgFjJRl7HHbm', 'Eslam':'7BrHBRzfWV6VIMTiKQs1', 'Mahmoud':'JREaX2U9h0J1OlTguAjs', 'Abdo':'NCkpgnEBEUNAtjioS58B', 'Zero':'cTtofZa7zvPWKvWmVl4q'};
    Future<Text> monday() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  {
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc(Uid('${widget.score}')).collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Date'];
          
      DateTime d = x.toDate();
      
      String H = DateFormat('EEE d MMM').format(d);
    return Text(H);

}
Future<Text> sunday() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
         
  if (widget.score=="Eslam"){
     DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Date'];
              print(x);
         
      DateTime d = x.toDate();
  
      
      String H = DateFormat('EEE d MMM').format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> wednesday() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Date'];
          
      DateTime d = x.toDate();
      
      String H = DateFormat('EEE d MMM').format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> thursday() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Date'];
          
      DateTime d = x.toDate();
  
      
      String H = DateFormat('EEE d MMM').format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}


Future<Text> tuesday() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
        DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Tuesday']['Date'];
          
      DateTime d = x.toDate();
      
      String H = DateFormat('EEE d MMM').format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
 Future<Text> mondayin() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Login'];
          
      DateTime d = x.toDate();
      
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> sundayin() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Login'];
          
      DateTime d = x.toDate();
      
      String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> wednesdayin() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Login'];
          
      DateTime d = x.toDate();
      
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> thursdayin() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
        DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Login'];
          
      DateTime d = x.toDate();
  
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}


Future<Text> tuesdayin() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Tuesday']['Login'];
          
      DateTime d = x.toDate();
      
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
  Future<Text> mondayout() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Logout'];
          
      DateTime d = x.toDate();
      
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> sundayout() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Logout'];
          
      DateTime d = x.toDate();
      
      String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> wednesdayout() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Logout'];
      DateTime d = x.toDate();
      
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> thursdayout() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
         DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Logout'];
          
      DateTime d = x.toDate();
  
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
Future<Text> tuesdaydout() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
        DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     Timestamp x =
          (snapShot.data()! as Map<String, dynamic>)['Tuesday']['Logout'];
          
      DateTime d = x.toDate();
      
       String H = DateFormat.jm().format(d);
    return Text(H);
  }
  else{
    return Text("x");
  }

}
  Future<Text> mondaydiff() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
    //  Timestamp x =
    //       (documentSnapshotEslam.data()! as Map<String, dynamic>)['Mondayout'];
          
    //         Timestamp y =
    //       (documentSnapshotEslam.data()! as Map<String, dynamic>)['Monday'];
          
          
    //  
        DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     int x =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Duration'];

    return Text('${x}');
  }
  else{
    return Text("x");
  }

}
Future<Text> sundaydiff() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
    DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     int x =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Duration'];
    return Text('${x}');
  }
  else{
    return Text("x");
  }

}
Future<Text> wednesdaydiff() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
   DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     int x =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Duration'];
    return Text('${x}');
  }
  else{
    return Text("x");
  }

}
Future<Text> thursdaydiff() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
     DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     int x =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Duration'];
    return Text('${x}');
  }
  else{
    return Text("x");
  }

}


Future<Text> tuesdaydiff() async {
  DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('Users')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    DocumentSnapshot documentSnapshotMahmoud = await FirebaseFirestore.instance
        .collection('Users')
        .doc('JREaX2U9h0J1OlTguAjs')
        .get();
    DocumentSnapshot documentSnapshotAbdo = await FirebaseFirestore.instance
        .collection('Users')
        .doc('cTtofZa7zvPWKvWmVl4q')
        .get();
    DocumentSnapshot documentSnapshotSamy = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Ar9k6kZPpgFjJRl7HHbm')
        .get();
    DocumentSnapshot documentSnapshotZero = await FirebaseFirestore.instance
        .collection('Users')
        .doc('NCkpgnEBEUNAtjioS58B')
        .get();
  if (widget.score=="Eslam"){
    DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
   
           final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
     int x =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Duration'];
    return Text('${x}');
  }
  else{
    return Text("x");
  }

}



 void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('You Have To Insert A Name '),
        action: SnackBarAction(
            label: 'Back', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _show4Toast(){
    if(widget.score == null){
      _showToast(context);
    }

  }

 
 
  @override  
  Widget build(BuildContext context) {
    _show4Toast();
    DateTime now = new DateTime.now();
    int dayOfYear = int.parse(DateFormat("D").format(now));
  num y =((dayOfYear - now.weekday + 10) / 7).floor();  
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            backgroundColor: Colors.transparent,
            title: Text('Login Per Week '), 
            centerTitle: true, 
          ),  
          body: Container(
                 decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/photo4.jpeg"),
                fit: BoxFit.cover,
              )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[  
              Center(  
                  child: Text(  
                    ' Week ${y}',  
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                  )),  
              Container(
                decoration: BoxDecoration(
    color: Colors.transparent,
   
    
    borderRadius: BorderRadius.circular(12),
  ),

                child: DataTable(  
                  columns: [  
                    DataColumn(label: Text(  
                        'Day',  
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)  
                    )),  
                    DataColumn(label: Text(  
                        'Login',  
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)  
                    )),  
                    DataColumn(label: Text(  
                        'Logout',  
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)  
                    )),
                     DataColumn(label: Text(  
                        'Duration',  
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)  
                    )),
                      
                  ],  
                  rows: [  
                    DataRow(cells: [  
                      DataCell(FutureBuilder(
                                          future: sunday(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),  
                      DataCell(FutureBuilder(
                                          future: sundayin(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),   
                      DataCell(FutureBuilder(
                                          future: sundayout(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),
                        DataCell(FutureBuilder(
                                          future: sundaydiff(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),  
                    ]),  
                    DataRow(cells: [  
                      DataCell(FutureBuilder(
                                          future: monday(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: mondayin(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: mondayout(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),  
                        DataCell(FutureBuilder(
                                          future: mondaydiff(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),
                    ]),  
                    DataRow(cells: [  
                      DataCell(FutureBuilder(
                                          future: tuesday(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: tuesdayin(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: tuesdaydout(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),
                      DataCell(FutureBuilder(
                                          future: tuesdaydiff(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),   
                    ]),  
                    DataRow(cells: [  
                      DataCell(FutureBuilder(
                                          future: wednesday(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: wednesdayin(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: wednesdayout(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),  
                      DataCell(FutureBuilder(
                                          future: wednesdaydiff(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),
                    ]),  
                     DataRow(cells: [  
                      DataCell(FutureBuilder(
                                          future: thursday(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: thursdayin(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),    
                      DataCell(FutureBuilder(
                                          future: thursdayout(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),     
                      DataCell(FutureBuilder(
                                          future: thursdaydiff(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return snapshot.data;
                                          },
                                        )),
                    ]),
                  ],  
                ),
              ),  
            ]),
          )  
      ),  
    );  
  }  
} 