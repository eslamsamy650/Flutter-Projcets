import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:project_07/add.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool change = false;
  bool loginButton = true;
  bool logoutButton = true;
  bool loading = false;
  bool bloaading =false ;
  late TextEditingController nameControllor;
  final database = FirebaseFirestore.instance.collection('Users').doc();
  final data = FirebaseFirestore.instance.collection('Users');
  final items = ['Eslam', 'Mahmoud', 'Abdo', 'Samy', 'Zero'];
  var _dropdownValue;

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  void _showDialog() {}

  @override
  void initState() {
    super.initState();
    nameControllor = new TextEditingController();
    nameControllor.addListener(() {
      final loginButton = nameControllor.text.isNotEmpty;
      setState(() {
        this.loginButton = loginButton;
        logoutButton = true;
      });
    });
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

  void _show3Toast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Connection Error , Try again later '),
        action: SnackBarAction(
            label: 'Back', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void BreakS(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text( ' Your Break Has Started '),
        action: SnackBarAction(
            label: 'Back', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void BreakE(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(' Your Break Has Ended '),
        action: SnackBarAction(
            label: 'Back', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _show2Toast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('You Have to login First '),
        action: SnackBarAction(
            label: 'Back', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  void dispose() {
    nameControllor.dispose();
    super.dispose();
  }

  Future<void> dropdownCallback(String? selectedValue) async {
    DocumentSnapshot documentSnapshotEslam = await FirebaseFirestore.instance
        .collection('my_contact')
        .doc('7BrHBRzfWV6VIMTiKQs1')
        .get();
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
        _subbutton();
      });
    }
  }

  Future<void> _subbutton() async {
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
    if (_dropdownValue == 'Eslam' &&
        (documentSnapshotEslam.data()! as Map<String, dynamic>)['Login'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Eslam' &&
        (documentSnapshotEslam.data()! as Map<String, dynamic>)['Login'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotEslam.data()! as Map<String, dynamic>)['BreakStart'] == 1) {
             logoutButton = false;
                }else if ((documentSnapshotEslam.data()! as Map<String, dynamic>)['BreakStart'] == 0){
                  logoutButton = true;

                }
        change = !false;
      });
    } else if (_dropdownValue == 'Mahmoud' &&
        (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['Login'] ==
            0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Mahmoud' &&
        (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['Login'] !=
            0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotMahmoud.data()! as Map<String, dynamic>)['BreakStart'] == 1) {
             logoutButton = false;
                }else if ((documentSnapshotMahmoud.data()! as Map<String, dynamic>)['BreakStart'] == 0){
                  logoutButton = true;

                }
        change = !false;
      });
    } else if (_dropdownValue == 'Abdo' &&
        (documentSnapshotAbdo.data()! as Map<String, dynamic>)['Login'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Abdo' &&
        (documentSnapshotAbdo.data()! as Map<String, dynamic>)['Login'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotAbdo.data()! as Map<String, dynamic>)['BreakStart'] == 1) {
             logoutButton = false;
                }else if ((documentSnapshotAbdo.data()! as Map<String, dynamic>)['BreakStart'] == 0){
                  logoutButton = true;

                }
        change = !false;
      });
    } else if (_dropdownValue == 'Samy' &&
        (documentSnapshotSamy.data()! as Map<String, dynamic>)['Login'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Samy' &&
        (documentSnapshotSamy.data()! as Map<String, dynamic>)['Login'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotAbdo.data()! as Map<String, dynamic>)['BreakStart'] == 1) {
             logoutButton = false;
                }else if ((documentSnapshotAbdo.data()! as Map<String, dynamic>)['BreakStart'] == 0){
                  logoutButton = true;

                }
        change = !false;
      });
    } else if (_dropdownValue == 'Zero' &&
        (documentSnapshotZero.data()! as Map<String, dynamic>)['Login'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Zero' &&
        (documentSnapshotZero.data()! as Map<String, dynamic>)['Login'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotAbdo.data()! as Map<String, dynamic>)['BreakStart'] == 1) {
             logoutButton = false;
                }else if ((documentSnapshotAbdo.data()! as Map<String, dynamic>)['BreakStart'] == 0){
                  logoutButton = true;

                }
        change = !false;
      });
    } else {
      _show3Toast(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String time = "${now.hour}:${now.minute}:${now.second}";

    print(now);

    DropdownMenuItem<String> bulidMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Time Sheet'),
        leading: const Icon(Icons.timelapse),
        centerTitle: true,
        actions: [
          
              
          IconButton(onPressed: () {}, icon: Icon(Icons.date_range))
        ],
      ),
      body: !change
          ? Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/photo2.jpeg"),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 00,
                      ),
                      Text(
                        'Insert Your Name',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      new DropdownButton<String>(
                        items: items.map(bulidMenuItem).toList(),
                        focusColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        dropdownColor: Colors.green,
                        value: _dropdownValue,
                        onChanged: dropdownCallback,
                        isExpanded: true,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      // TextFormField(
                      //   controller: nameControllor,
                      //   decoration: InputDecoration(
                      //       labelText: 'Name', border: OutlineInputBorder()),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      ElevatedButton(
                        onPressed: loginButton
                            ? () async {
                                if (loading) return;
                                print(_dropdownValue);
                                setState(() {
                                  loading = true;
                                });
                                await Future.delayed(Duration(seconds: 2));
                                setState(() {
                                  loginButton = false;
                                  logoutButton = true;
                                });

                                if (_dropdownValue == 'Eslam') {
                                  setState(() {
                                    loginButton = false;
                                    logoutButton = true;
                                    change = !false;
                                    loading = false;
                                  });
                                  data.doc('7BrHBRzfWV6VIMTiKQs1').update({
                                    'Name': _dropdownValue,
                                    'Login': DateTime.now()
                                  });
                                } else if (_dropdownValue == 'Mahmoud') {
                                  setState(() {
                                    loginButton = false;
                                    logoutButton = true;
                                    change = !false;
                                    loading = false;
                                  });
                                  data.doc('JREaX2U9h0J1OlTguAjs').update({
                                    'Name': _dropdownValue,
                                    'Login': DateTime.now()
                                  });
                                } else if (_dropdownValue == 'Abdo') {
                                  setState(() {
                                    loginButton = false;
                                    logoutButton = true;
                                    change = !false;
                                    loading = false;
                                  });
                                  data.doc('cTtofZa7zvPWKvWmVl4q').update({
                                    'Name': _dropdownValue,
                                    'Login': DateTime.now()
                                  });
                                } else if (_dropdownValue == 'Samy') {
                                  setState(() {
                                    loginButton = false;
                                    logoutButton = true;
                                    change = !false;
                                    loading = false;
                                  });
                                  data.doc('Ar9k6kZPpgFjJRl7HHbm').update({
                                    'Name': _dropdownValue,
                                    'Login': DateTime.now()
                                  });
                                } else if (_dropdownValue == 'Zero') {
                                  setState(() {
                                    loginButton = false;
                                    logoutButton = true;
                                    change = !false;
                                    loading = false;
                                  });
                                  data.doc('NCkpgnEBEUNAtjioS58B').update({
                                    'Name': _dropdownValue,
                                    'Login': DateTime.now()
                                  });
                                } else {
                                  _showToast(context);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Add()));
                                  setState(() {
                                    loading = false;
                                  });
                                }

                                ;
                              }
                            : null,
                        child: loading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                      color: Colors.white),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Text("Please Wait ...")
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(Icons.directions_walk_outlined),
                                  Text(
                                    '   LogIn',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            minimumSize: Size.fromHeight(72),
                            shape: StadiumBorder(),
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/photo.jpeg"),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Insert Your Name',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      new DropdownButton<String>(
                        items: items.map(bulidMenuItem).toList(),
                        focusColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        dropdownColor: Colors.brown,
                        value: _dropdownValue,
                        onChanged: dropdownCallback,
                        isExpanded: true,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      // TextFormField(
                      //   controller: nameControllor,
                      //   decoration: InputDecoration(
                      //       labelText: 'Name', border: OutlineInputBorder()),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      SizedBox(
                        height: 15,
                      ),
                      ButtonTheme(
                        minWidth: 200.0,
                        height: 100.0,
                        buttonColor: Colors.redAccent,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: logoutButton
                                  ? () async {
                                      if (loading) return;

                                      setState(() {
                                        loading = true;
                                      });
                                      await Future.delayed(Duration(seconds: 2));
                                      final tome = DateTime.now();
                                      String xtime =
                                          "${tome.hour}:${tome.minute}:${tome.second}";
                                      DocumentSnapshot documentSnapshotEslam =
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc('7BrHBRzfWV6VIMTiKQs1')
                                              .get();
                                      DocumentSnapshot documentSnapshotMahmoud =
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc('JREaX2U9h0J1OlTguAjs')
                                              .get();
                                      DocumentSnapshot documentSnapshotAbdo =
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc('cTtofZa7zvPWKvWmVl4q')
                                              .get();
                                      DocumentSnapshot documentSnapshotSamy =
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc('Ar9k6kZPpgFjJRl7HHbm')
                                              .get();
                                      DocumentSnapshot documentSnapshotZero =
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc('NCkpgnEBEUNAtjioS58B')
                                              .get();

                                      if (_dropdownValue == 'Eslam') {
                                         num P=0;
                                         num C=0;
                                         
                                        final now = DateTime.now();
                                        Timestamp t = (documentSnapshotEslam.data()!
                                            as Map<String, dynamic>)['Login'];
                                        DateTime d = t.toDate();
                                       

                                        setState(() {
                                          loginButton = true;
                                          logoutButton = false;
                                          change = false;
                                          loading = false;
                                          num H=0;
                                         num S =0;
                                         num M=0;

                                          Future.delayed(Duration(seconds: 0), () {
                                             if ((documentSnapshotEslam.data()!
                                            as Map<String, dynamic>)['pause']!=0) {
                                              Timestamp p =(documentSnapshotEslam.data()!
                                            as Map<String, dynamic>)['pause'];
                                            DateTime P = p.toDate();
                                        Timestamp c =(documentSnapshotEslam.data()!
                                            as Map<String, dynamic>)['resume'];
                                            DateTime C = c.toDate();
                                            num H = (C.hour-now.hour) +( d.hour-P.hour);
                                            num M = (C.minute-now.minute) +( d.minute-P.minute);
                                            num S = (-C.second-now.second) +( d.second-P.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));
                                          
                                        }else{
                                         num P=0;
                                         num C=0;
                                            num H = (now.hour-d.hour);
                                            num M = (now.minute) -( d.minute);
                                            num S = (now.second) -( d.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));

                                        }                                      // print(now.second);
                                            // print(d.second);
                                            // print(S);
                                            
                                          });
                                        });
                                        data.doc('7BrHBRzfWV6VIMTiKQs1').update(
                                            {'logout': DateTime.now(), 'Login': 0,'pause':0,'resume':0});
                                      } else if (_dropdownValue == 'Mahmoud') {
                                        final now = DateTime.now();
                                        Timestamp t = (documentSnapshotMahmoud.data()!
                                            as Map<String, dynamic>)['Login'];
                                        DateTime d = t.toDate();
                                        

                                        setState(() {
                                          loginButton = true;
                                          logoutButton = false;
                                          change = false;
                                          loading = false;

                                           num H=0;
                                         num S =0;
                                         num M=0;

                                          Future.delayed(Duration(seconds: 0), () {
                                             if ((documentSnapshotMahmoud.data()!
                                            as Map<String, dynamic>)['pause']!=0) {
                                              Timestamp p =(documentSnapshotMahmoud.data()!
                                            as Map<String, dynamic>)['pause'];
                                            DateTime P = p.toDate();
                                        Timestamp c =(documentSnapshotMahmoud.data()!
                                            as Map<String, dynamic>)['resume'];
                                            DateTime C = c.toDate();

                                            num H = (C.hour-now.hour) +( d.hour-P.hour);
                                            num M = (C.minute-now.minute) +( d.minute-P.minute);
                                            num S = (-C.second-now.second) +( d.second-P.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));
                                          
                                        }else{
                                         num P=0;
                                         num C=0;
                                            num H = (now.hour-d.hour);
                                            num M = (now.minute) -( d.minute);
                                            num S = (now.second) -( d.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));

                                        }                                
                                            // print(now.second);
                                            // print(d.second);
                                           
                                          });
                                        });
                                        data.doc('JREaX2U9h0J1OlTguAjs').update(
                                            {'logout': DateTime.now(), 'Login': 0,'pause':0,'resume':0});
                                      } else if (_dropdownValue == 'Abdo') {
                                        final now = DateTime.now();
                                        Timestamp t = (documentSnapshotAbdo.data()!
                                            as Map<String, dynamic>)['Login'];
                                        DateTime d = t.toDate();
                                        
                                        setState(() {
                                          loginButton = true;
                                          logoutButton = false;
                                          change = false;
                                          loading = false;

                                             num H=0;
                                         num S =0;
                                         num M=0;

                                          Future.delayed(Duration(seconds: 0), () {
                                             if ((documentSnapshotAbdo.data()!
                                            as Map<String, dynamic>)['pause']!=0) {
                                              Timestamp p =(documentSnapshotAbdo.data()!
                                            as Map<String, dynamic>)['pause'];
                                            DateTime P = p.toDate();
                                        Timestamp c =(documentSnapshotAbdo.data()!
                                            as Map<String, dynamic>)['resume'];
                                            DateTime C = c.toDate();

                                            num H = (C.hour-now.hour) +( d.hour-P.hour);
                                            num M = (C.minute-now.minute) +( d.minute-P.minute);
                                            num S = (-C.second-now.second) +( d.second-P.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));
                                          
                                        }else{
                                         num P=0;
                                         num C=0;
                                            num H = (now.hour-d.hour);
                                            num M = (now.minute) -( d.minute);
                                            num S = (now.second) -( d.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));

                                        }                                
                                            // print(now.second);
                                            // print(d.second);
                                            // print(S);
                                           
                                          });
                                        });
                                        data.doc('cTtofZa7zvPWKvWmVl4q').update(
                                            {'logout': DateTime.now(), 'Login': 0,'pause':0,'resume':0});
                                      } else if (_dropdownValue == 'Samy') {
                                        final now = DateTime.now();
                                         Timestamp t = (documentSnapshotSamy.data()!
                                            as Map<String, dynamic>)['Login'];
                                        DateTime d = t.toDate();
                                       

                                        setState(() {
                                          loginButton = true;
                                          logoutButton = false;
                                          change = false;
                                          loading = false;

                                             num H=0;
                                         num S =0;
                                         num M=0;

                                          Future.delayed(Duration(seconds: 0), () {
                                             if ((documentSnapshotSamy.data()!
                                            as Map<String, dynamic>)['pause']!=0) {
                                              Timestamp p =(documentSnapshotSamy.data()!
                                            as Map<String, dynamic>)['pause'];
                                            DateTime P = p.toDate();
                                        Timestamp c =(documentSnapshotSamy.data()!
                                            as Map<String, dynamic>)['resume'];
                                            DateTime C = c.toDate();

                                            num H = (C.hour-now.hour) +( d.hour-P.hour);
                                            num M = (C.minute-now.minute) +( d.minute-P.minute);
                                            num S = (-C.second-now.second) +( d.second-P.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));
                                          
                                        }else{
                                         num P=0;
                                         num C=0;
                                            num H = (now.hour-d.hour);
                                            num M = (now.minute) -( d.minute);
                                            num S = (now.second) -( d.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));

                                        }                                
                                            // print(now.second);
                                            // print(d.second);
                                           
                                          });
                                        });
                                        data.doc('Ar9k6kZPpgFjJRl7HHbm').update(
                                            {'logout': DateTime.now(), 'Login': 0,'pause':0,'resume':0});
                                      } else if (_dropdownValue == 'Zero') {
                                        final now = DateTime.now();
                                         Timestamp t = (documentSnapshotZero.data()!
                                            as Map<String, dynamic>)['Login'];
                                        DateTime d = t.toDate();
                                       

                                        setState(() {
                                          loginButton = true;
                                          logoutButton = false;
                                          change = false;

                                         num H=0;
                                         num S =0;
                                         num M=0;

                                          Future.delayed(Duration(seconds: 0), () {
                                             if ((documentSnapshotZero.data()!
                                            as Map<String, dynamic>)['pause']!=0) {
                                              Timestamp p =(documentSnapshotZero.data()!
                                            as Map<String, dynamic>)['pause'];
                                            DateTime P = p.toDate();
                                        Timestamp c =(documentSnapshotZero.data()!
                                            as Map<String, dynamic>)['resume'];
                                            DateTime C = c.toDate();

                                            num H = (C.hour-now.hour) +( d.hour-P.hour);
                                            num M = (C.minute-now.minute) +( d.minute-P.minute);
                                            num S = (-C.second-now.second) +( d.second-P.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));
                                          
                                        }else{
                                         num P=0;
                                         num C=0;
                                            num H = (now.hour-d.hour);
                                            num M = (now.minute) -( d.minute);
                                            num S = (now.second) -( d.second);
                                                if(H<0) {
                                             H= H*-1;
                                            }
                                             if(M<0){
                                              M=M*-1;
                                            }
                                             if (S<0){
                                              S=S*-1;

                                            }
                                            if (S>60){
                                              M=M+1;
                                              S=0;
                                            }
                                            if (M>60) {
                                              H=H+1;
                                              M=0;
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (_) => SimpleDialog(
                                                      title: Text(
                                                          '${_dropdownValue} You Have Worked '),
                                                      children: [
                                                        Text(
                                                            '${H} Hours :${M} Minutes :${S} Seconds')
                                                      ],
                                                      contentPadding:
                                                          EdgeInsets.all(25),
                                                    ));

                                        }                                
                                            // print(now.second);
                                            // print(d.second);
                                           
                                          });
                                        });
                                        data.doc('NCkpgnEBEUNAtjioS58B').update(
                                            {'logout': DateTime.now(), 'Login': 0,'pause':0,'resume':0});
                                      } else {
                                        _show3Toast(context);
                                      }
                                      _showDialog();

                                      setState(() {
                                        // loginButton = true;
                                        // logoutButton = false;
                                        //
                                      });
                                    }
                                  : null,
                              child: loading
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Text("Please Wait ...")
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          '  LogOut      ',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.login_outlined),
                                      ],
                                    ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  minimumSize: Size.fromHeight(72),
                                  shape: StadiumBorder(),
                                  textStyle: const TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 15,),
                            logoutButton?
                            ElevatedButton(onPressed: () async {  !change
                    ? _show2Toast(context)
                    : setState(
                        () async {
                          bloaading=true;
                          BreakS(context);
                          logoutButton = false;
                          await Future.delayed(Duration(seconds: 0));
                          if (_dropdownValue == 'Eslam') {
                            setState(() {bloaading=false;});
                            data
                                .doc('7BrHBRzfWV6VIMTiKQs1')
                                .update({'pause': DateTime.now(),'BreakStart':1});
                          } else if (_dropdownValue == 'Mahmoud') {
                            setState(() {bloaading=false;});
                            data
                                .doc('JREaX2U9h0J1OlTguAjs')
                                .update({'pause': DateTime.now(),'BreakStart':1});
                          } else if (_dropdownValue == 'Abdo') {
                            setState(() {bloaading=false;});
                            data
                                .doc('cTtofZa7zvPWKvWmVl4q')
                                .update({'pause': DateTime.now(),'BreakStart':1});
                          } else if (_dropdownValue == 'Samy') {
                            setState(() {bloaading=false;});
                            data
                                .doc('Ar9k6kZPpgFjJRl7HHbm')
                                .update({'pause': DateTime.now(),'BreakStart':1});
                          } else if (_dropdownValue == 'Zero') {
                            setState(() {bloaading=false;});
                            data
                                .doc('NCkpgnEBEUNAtjioS58B')
                                .update({'pause': DateTime.now(),'BreakStart':1});
                          } else {
                            _showToast(context);
                            logoutButton = false;
                          }
                        },
                      );
                await Future.delayed(Duration(minutes: 30));
                setState(() async {
                  bloaading =true;
                  BreakE(context);
                  await Future.delayed(Duration(seconds: 2));
                  if (_dropdownValue == 'Eslam') {
                            setState(() 
                            {
                              bloaading=false;
                            });
                            data
                                .doc('7BrHBRzfWV6VIMTiKQs1')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Mahmoud') {
                            setState(() {bloaading=false;});
                            data
                                .doc('JREaX2U9h0J1OlTguAjs')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Abdo') {
                            setState(() {bloaading=false;});
                            data
                                .doc('cTtofZa7zvPWKvWmVl4q')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Samy') {
                            setState(() {bloaading=false;});
                            data
                                .doc('Ar9k6kZPpgFjJRl7HHbm')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Zero') {
                            setState(() {bloaading=false;});
                            data
                                .doc('NCkpgnEBEUNAtjioS58B')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else {
                            _showToast(context);
                            logoutButton = false;
                          }
                  logoutButton = true;
          
                });
                ;
                              
                            }, child:bloaading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                      color: Colors.white),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Text(" You Break is gonna Start in Few Seconds")
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(Icons.food_bank),
                                  Text(
                                    '   Start Break',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            minimumSize: Size.fromHeight(72),
                            shape: StadiumBorder(),
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),)
                            :ElevatedButton(onPressed: () {
                                !change
                    ? _show2Toast(context)
                    : setState(() {
                      BreakE(context);
                        logoutButton = true;
                        if (_dropdownValue == 'Eslam') {
                            setState(() {});
                            data
                                .doc('7BrHBRzfWV6VIMTiKQs1')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Mahmoud') {
                            setState(() {});
                            data
                                .doc('JREaX2U9h0J1OlTguAjs')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Abdo') {
                            setState(() {});
                            data
                                .doc('cTtofZa7zvPWKvWmVl4q')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Samy') {
                            setState(() {});
                            data
                                .doc('Ar9k6kZPpgFjJRl7HHbm')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else if (_dropdownValue == 'Zero') {
                            setState(() {});
                            data
                                .doc('NCkpgnEBEUNAtjioS58B')
                                .update({'resume': DateTime.now(),'BreakStart':0});
                          } else {
                            _showToast(context);
                            logoutButton = false;
                          }
                      });
                              
                            }, child: bloaading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                      color: Colors.white),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Text(" You Break is gonna End in Few Seconds")
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(Icons.work_outline),
                                  Text(
                                    '   End Break',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            minimumSize: Size.fromHeight(72),
                            shape: StadiumBorder(),
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
