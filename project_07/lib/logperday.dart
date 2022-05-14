import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 final data = FirebaseFirestore.instance.collection('Users');

class perDay extends StatefulWidget {
   final String score ;

  const perDay({
    Key? key,
      required this.score
   }) : super(key: key);

  @override
  State<perDay> createState() => _perDayState();
}

class _perDayState extends State<perDay> {
   Future<dynamic> logtimo() async {
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

    if (widget.score == "Eslam") {
      Timestamp x =
          (documentSnapshotEslam.data()! as Map<String, dynamic>)['logout'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Mahmoud") {
      Timestamp x =
          (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['logout'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Abdo") {
      Timestamp x =
          (documentSnapshotAbdo.data()! as Map<String, dynamic>)['logout'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Samy") {
      Timestamp x =
          (documentSnapshotSamy.data()! as Map<String, dynamic>)['logout'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Zero") {
      Timestamp x =
          (documentSnapshotZero.data()! as Map<String, dynamic>)['logout'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else {
      return Text("error");
    }
  }
    Future<dynamic> logtim() async {
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

    if (widget.score == "Eslam") {
      Timestamp x =
          (documentSnapshotEslam.data()! as Map<String, dynamic>)['Login'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);

      return H;
    } else if (widget.score == "Mahmoud") {
      Timestamp x =
          (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['Login'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Abdo") {
      Timestamp x =
          (documentSnapshotAbdo.data()! as Map<String, dynamic>)['Login'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Samy") {
      Timestamp x =
          (documentSnapshotSamy.data()! as Map<String, dynamic>)['Login'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Zero") {
      Timestamp x =
          (documentSnapshotZero.data()! as Map<String, dynamic>)['Login'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else {
      return Text("error");
    }
  }

  Future<dynamic> BrkStrt() async {
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

    if (widget.score == "Eslam") {
      Timestamp x =
          (documentSnapshotEslam.data()! as Map<String, dynamic>)['pause'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);

      return H;
    } else if (widget.score == "Mahmoud") {
      Timestamp x =
          (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['pause'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Abdo") {
      Timestamp x =
          (documentSnapshotAbdo.data()! as Map<String, dynamic>)['pause'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Samy") {
      Timestamp x =
          (documentSnapshotSamy.data()! as Map<String, dynamic>)['pause'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Zero") {
      Timestamp x =
          (documentSnapshotZero.data()! as Map<String, dynamic>)['pause'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else {
      return Text("error");
    }
  }

  Future<dynamic> BrkEnd() async {
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

    if (widget.score == "Eslam") {
      Timestamp x =
          (documentSnapshotEslam.data()! as Map<String, dynamic>)['resume'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);

      return H;
    } else if (widget.score == "Mahmoud") {
      Timestamp x =
          (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['resume'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Abdo") {
      Timestamp x =
          (documentSnapshotAbdo.data()! as Map<String, dynamic>)['resume'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Samy") {
      Timestamp x =
          (documentSnapshotSamy.data()! as Map<String, dynamic>)['resume'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else if (widget.score == "Zero") {
      Timestamp x =
          (documentSnapshotZero.data()! as Map<String, dynamic>)['resume'];
      DateTime d = x.toDate();
      String H = DateFormat.jm().format(d);
      return H;
    } else {
      return Text("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Login Per Day'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
       
        
      ),
      body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/photo3.jpeg"),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      
                       Container(
                              width: 350,
                              child: DataTable(
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  columns: [
                                    DataColumn(label: Text(" Last Login")),
                                    DataColumn(label: Text(" Last Logout ")),
                                  ],
                                  rows: [
                                    //  DataRow(cells: [cells])
                                  ]),
                            ),
                           
                                 DataTable(
                                    decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    columns: [
                                        DataColumn(
                                            label: FutureBuilder(
                                          future: logtim(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return Text(snapshot.data);
                                          },
                                        )),
                                        DataColumn(
                                            label: FutureBuilder(
                                          future: logtimo(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                             
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return Text(snapshot.data);
                                          },
                                        )),
                                      ],
                                    rows: [
                                        //  DataRow(cells: [cells])
                                      ]),
                            SizedBox(height: 20),
                            DataTable(
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                columns: [
                                  DataColumn(label: Text("Start Break Time")),
                                  DataColumn(label: Text("End Break Time")),
                                ],
                                rows: [
                                  //  DataRow(cells: [cells])
                                ]),
                             DataTable(
                                    decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    columns: [
                                        DataColumn(
                                            label: FutureBuilder(
                                          future: BrkStrt(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                  child: Text('00:00'));
                                            }
                                            return Text(snapshot.data);
                                          },
                                        )),
                                        DataColumn(
                                            label: FutureBuilder(
                                          future: BrkEnd(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              
                                              return Center(
                                                  child: Text('00:00'));
                                            }
                                            return Text(snapshot.data);
                                          },
                                        )),
                                      ],
                                    rows: [
                                        //  DataRow(cells: [cells])
                                      ]),
                                
                     ],
                   ),
                   ),

      ),
      )
    );
    
  }
}