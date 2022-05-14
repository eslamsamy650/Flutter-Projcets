import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_07/Week.dart';
import 'package:project_07/add.dart';
import 'package:project_07/logperday.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Duration Eduration = Duration();
  Duration bduration = Duration();
  

  Timer? etimer;
  Timer? btimer;
  bool change = false;
  bool loginButton = true;
  bool logoutButton = true;
  bool loading = false;
  bool bloaading = false;
  late TextEditingController nameControllor;
  final database = FirebaseFirestore.instance.collection('Users').doc();
  final data = FirebaseFirestore.instance.collection('Users');
  final wdata = FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks');
  final items = ['Eslam', 'Mahmoud', 'Abdo', 'Samy', 'Zero'];
  var _dropdownValue;
  var logtime = "Samy";
  bool countDown = true;
  static const countdowndurstion =Duration(minutes:30);


  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  DateTime timeD(DateTime time1, DateTime time2) {
    DateTime x = time1.subtract(Duration(
        hours: time2.hour, minutes: time2.minute, seconds: time2.second));
    return (x);
  }
   Duration timer(DateTime time1, DateTime time2) {
    final x = time1.difference(time2);
    return (x);
  }
  

  Text TimerText() {
    if (_dropdownValue == "Eslam") {
      String twoDigits(int n) => n.toString().padLeft(2,"0");
      final eminutes = twoDigits(Eduration.inMinutes.remainder(60));
      final eseconds = twoDigits(Eduration.inSeconds.remainder(60));
      final ehours = twoDigits(Eduration.inHours);
      return Text('$ehours:$eminutes:$eseconds',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),);
    } else {
      return Text('Error');
    }
  }
   Future<Text> TimerTest() async {
    if (_dropdownValue == "Eslam") {
      
  
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

      final now = DateTime.now();
       Timestamp t =
          (documentSnapshotEslam.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
           DateTime x =t.toDate();
           final defftime=now.difference(x);
           num m= defftime.inMinutes;
           num s =defftime.inSeconds;
           num h =defftime.inHours;

     
      return Text('${h}:${m}:${s}');
    } else {
      return Text('Error');
    }
  }

  Text CountText() {
    if (_dropdownValue=='Eslam') {
      String twoDigits(int n) => n.toString().padLeft(2,"0");
      final eminutes = twoDigits(bduration.inMinutes.remainder(60));
      final eseconds = twoDigits(bduration.inSeconds.remainder(60));
      final ehours = twoDigits(bduration.inHours);
      return Text('$ehours:$eminutes:$eseconds',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),);
    } else {
      return Text('Error');
    }
  }

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
        content: const Text(' Your Break Has Started '),
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




  //   if (_dropdownValue == "Eslam") {
  //     Timestamp x =
  //         (documentSnapshotEslam.data()! as Map<String, dynamic>)['Duration'];
  //     DateTime d = x.toDate();
  //     String H = DateFormat.Hm().format(d);

  //     return H;
  //   } else if (_dropdownValue == 'Mahmoud') {
  //     Timestamp x =
  //         (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['Duration'];
  //     DateTime d = x.toDate();
  //     String H = DateFormat.Hm().format(d);
  //     return H;
  //   } else if (_dropdownValue == 'Abdo') {
  //     Timestamp x =
  //         (documentSnapshotAbdo.data()! as Map<String, dynamic>)['Duration'];
  //     DateTime d = x.toDate();
  //     String H = DateFormat.Hm().format(d);
  //     return H;
  //   } else if (_dropdownValue == 'Samy') {
  //     Timestamp x =
  //         (documentSnapshotSamy.data()! as Map<String, dynamic>)['Duration'];
  //     DateTime d = x.toDate();
  //     String H = DateFormat.Hm().format(d);
  //     return H;
  //   } else if (_dropdownValue == 'Zero') {
  //     Timestamp x =
  //         (documentSnapshotZero.data()! as Map<String, dynamic>)['Duration'];
  //     DateTime d = x.toDate();
  //     String H = DateFormat.Hm().format(d);
  //     return H;
  //   } else {
  //     return Text("error");
  //   }
  // }



  void startTimer({bool resets=true}) {
    if (resets) {
      reset();
      
    }
    etimer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }
   void startcounter({bool resets=true}) {
      if (resets) {
      reset();
      
    }
    
    btimer = Timer.periodic(Duration(seconds:1), (_) => brkcount());
  }
  void reset(){
    if (countDown) {
      setState(() {
        bduration =countdowndurstion;
        
      });
      
    } else {
      setState(() {
        bduration =bduration;
        Eduration=Eduration;
        
      });
    }
  }
  void stopTimer({bool resets = true}){
    if (resets) {
      reset();
      
    }

     setState(() {
       etimer?.cancel();
       
     });

  }
   void stopCount({bool resets = true}){
    if (resets) {
      reset();
      
    }

    btimer?.cancel();
    countDown=false;

  }
void brkcount() {
    final addSeconds = -1;
    if (_dropdownValue == "Eslam") {
      setState(() {
        final seconds = bduration.inSeconds + addSeconds;
        if (seconds<0) {
          btimer?.cancel();
          logoutButton=true;
                  startTimer(resets: false);    
                                              
                                                    
                                                    

          
        } 
        else if (logoutButton){
          btimer?.cancel();

        }
        else {
          bduration = Duration(seconds: seconds);
        }
      });
    } else {}
  }

 



  Future<void> addTime() async {
    final addSeconds = 1;
    if (_dropdownValue == "Eslam") {
      
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

      final now = DateTime.now();
       Timestamp t =
          (documentSnapshotEslam.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
           DateTime x =t.toDate();
           final defftime=now.difference(x);
           int m= defftime.inMinutes;
           int s =defftime.inSeconds;
           int h =defftime.inHours;
      setState(() {
        
        Eduration = Duration(seconds: s,minutes:m ,hours: h);
      });
    } else {}
  }

  Future<void> dropdownCallback(String? selectedValue) async {
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
        (documentSnapshotEslam.data()! as Map<String, dynamic>)['Logon'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Eslam' &&
        (documentSnapshotEslam.data()! as Map<String, dynamic>)['Logon'] != 0) {
      setState(() {
        loginButton = false;

        if ((documentSnapshotEslam.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            1) {
          logoutButton = false;
        } else if ((documentSnapshotEslam.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            0) {
          logoutButton = true;
        }
        change = !false;
      });
    } else if (_dropdownValue == 'Mahmoud' &&
        (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['Logon'] ==
            0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Mahmoud' &&
        (documentSnapshotMahmoud.data()! as Map<String, dynamic>)['Logon'] !=
            0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotMahmoud.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            1) {
          logoutButton = false;
        } else if ((documentSnapshotMahmoud.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            0) {
          logoutButton = true;
        }
        change = !false;
      });
    } else if (_dropdownValue == 'Abdo' &&
        (documentSnapshotAbdo.data()! as Map<String, dynamic>)['Logon'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Abdo' &&
        (documentSnapshotAbdo.data()! as Map<String, dynamic>)['Logon'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotAbdo.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            1) {
          logoutButton = false;
        } else if ((documentSnapshotAbdo.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            0) {
          logoutButton = true;
        }
        change = !false;
      });
    } else if (_dropdownValue == 'Samy' &&
        (documentSnapshotSamy.data()! as Map<String, dynamic>)['Logon'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Samy' &&
        (documentSnapshotSamy.data()! as Map<String, dynamic>)['Logon'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotAbdo.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            1) {
          logoutButton = false;
        } else if ((documentSnapshotAbdo.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            0) {
          logoutButton = true;
        }
        change = !false;
      });
    } else if (_dropdownValue == 'Zero' &&
        (documentSnapshotZero.data()! as Map<String, dynamic>)['Logon'] == 0) {
      setState(() {
        loginButton = true;
        logoutButton = false;
        change = false;
      });
    } else if (_dropdownValue == 'Zero' &&
        (documentSnapshotZero.data()! as Map<String, dynamic>)['Logon'] != 0) {
      setState(() {
        loginButton = false;
        if ((documentSnapshotAbdo.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            1) {
          logoutButton = false;
        } else if ((documentSnapshotAbdo.data()!
                as Map<String, dynamic>)['BreakStart'] ==
            0) {
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
        actions: [IconButton(onPressed: () async { if (_dropdownValue==null) {
       _showToast(context);
          
        } else {
          if (_dropdownValue=='Eslam') {
            DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
            
            Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now()); 
            
           
         
         


              final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();

if (snapShot == null || !snapShot.exists) {
  // Document with id == varuId doesn't exist.
print("Error");
  // You can add data to Firebase Firestore here
}
 

      
                            if (snapShot == null || !snapShot.exists) {
                             final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                                                    final date = DateTime.now();
  
  print('Date: $date');
  DateTime Day1= (date.subtract(Duration(days: date.weekday )));
  print(Day1);
  DateTime Day2= (date.subtract(Duration(days: date.weekday -1)));
  print(Day1);
  DateTime Day3= (date.subtract(Duration(days: date.weekday-2 )));
  print(Day1);
  DateTime Day4= (date.subtract(Duration(days: date.weekday-3 )));
  print(Day1);
  DateTime Day5= (date.add(Duration(days: DateTime.daysPerWeek - date.weekday-3)));
  print(Day5);

                       Map<String ,Map> Eslam={
                         "Sunday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day1 },
                         "Monday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day2},
                        "Tuesday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day3},
                         "Wednesday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day4},
                         "Thursday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day5},

                       };
                       await doc.set(Eslam);

                       print(doc);

                              
                                //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  perDay(score:_dropdownValue)));
          
                              
                            } else {
                              
                              print("Okay");
 Navigator.push(context, MaterialPageRoute(builder: (context) => week(score: _dropdownValue)));
                       

                            }


            
          } else {
          }
            
        }
         
        }, icon: Icon(Icons.date_range))],
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
                              countDown=true;
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
                                
                                print(_dropdownValue);
                                setState(() {
                                  loading = true;
                                  reset();
                                        Eduration=Duration();
                                        startTimer();
                                        
                                });

                                await Future.delayed(Duration(seconds: 2));

                                 
                                setState(() {
                                  loginButton = false;
                                  logoutButton = true;
                                });

                                if (_dropdownValue == 'Eslam') {
                                  
                                  setState(()  {
                                  
                                   
                                    loginButton = false;
                                    logoutButton = true;
                                    change = !false;
                                    loading = false;
                                  });
                                  
                                  data.doc('7BrHBRzfWV6VIMTiKQs1').update({
                                    'Name': _dropdownValue,
                                    'Login': DateTime.now(),
                                    'Logon': 1,
                                    
                                  }

                                  
                                  );
                                    DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
            
            Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now()); 
            
           
         
         


              final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();

if (snapShot == null || !snapShot.exists) {
  // Document with id == varuId doesn't exist.
print("Error");
  // You can add data to Firebase Firestore here
}
 

      
                            if (snapShot == null || !snapShot.exists) {
                             final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                                                    final date = DateTime.now();
  
  print('Date: $date');
  DateTime Day1= (date.subtract(Duration(days: date.weekday )));
  print(Day1);
  DateTime Day2= (date.subtract(Duration(days: date.weekday -1)));
  print(Day1);
  DateTime Day3= (date.subtract(Duration(days: date.weekday-2 )));
  print(Day1);
  DateTime Day4= (date.subtract(Duration(days: date.weekday-3 )));
  print(Day1);
  DateTime Day5= (date.add(Duration(days: DateTime.daysPerWeek - date.weekday-3)));
  print(Day5);

                       Map<String ,Map> Eslam={
                         "Sunday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day1 },
                         "Monday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day2},
                         "Tuesday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day3},
                         "Wednesday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day4},
                         "Thursday":{"Login":DateTime.now(),"Logout":DateTime.now(),"Duration":0,"Date":Day5},

                       };
                       await doc.set(Eslam);

                       print(doc);

                              
                                //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  perDay(score:_dropdownValue)));
          
                              
                            } else {
                              Timestamp x =
                                             (documentSnapshotEslam.data()! as Map<String, dynamic>)['Login'];
                                                DateTime d = x.toDate();
                                        String H = DateFormat('EEEE').format(d);
                                          DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
                                        if (H=="Sunday") {
                                          final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                                  FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Sunday.Login' : DateTime.now(),
    
  }
  );
                                          
                                  
                                          
                                          
                                        }
                                        else if (H=="Monday"){
                                                final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                                     FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Monday.Login' : DateTime.now(),
    
  }
  );

                                        }
                                          else if (H=="Tuesday"){
                                              final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                          FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Tuesday.Login' : DateTime.now(),
    
  }
  );

                                        }
                                          else if (H=="Wednesday"){
                                             final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                                      FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Wednesday.Login' : DateTime.now(),
    
  }
  );

                                        }
                                          else if (H=="Thursday"){
                                              final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                       FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Thursday.Login' : DateTime.now(),
    
  }
  );
                                        }
                                        else{
                                          return print("null");
                                        }
                              
                              print("Okay");
 
                       

                            }
                                    

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
                                    ,'Logon': 1,
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
                                    ,'Logon': 1,
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
                                    ,'Logon': 1,
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
                                    ,'Logon': 1,
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
                                  
                                    
                                setState(() {
                                 
                                  bloaading = false;
                                  loading = false;
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
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: logoutButton
                                      ? () async {
                                        
                                        reset();
                                        Eduration=Duration();
                                        stopTimer(resets: false);
                                        
                                          if (loading) return;
                                          

                                          setState(() {
                                            loading = true;
                                            bloaading = true;
                                            
                                          });
                                          await Future.delayed(
                                              Duration(seconds: 2));
                                              Eduration=Duration();
                                              stopTimer(resets: false);
                                              

                                          DocumentSnapshot
                                              documentSnapshotEslam =
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc('7BrHBRzfWV6VIMTiKQs1')
                                                  .get();
                                          DocumentSnapshot
                                              documentSnapshotMahmoud =
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc('JREaX2U9h0J1OlTguAjs')
                                                  .get();
                                          DocumentSnapshot
                                              documentSnapshotAbdo =
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc('cTtofZa7zvPWKvWmVl4q')
                                                  .get();
                                          DocumentSnapshot
                                              documentSnapshotSamy =
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc('Ar9k6kZPpgFjJRl7HHbm')
                                                  .get();
                                          DocumentSnapshot
                                              documentSnapshotZero =
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc('NCkpgnEBEUNAtjioS58B')
                                                  .get();

                                          if (_dropdownValue == 'Eslam') {
                                            final now = DateTime.now();
                                            Timestamp t =
                                                (documentSnapshotEslam.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
                                            Timestamp x =
                                                (documentSnapshotEslam.data()!
                                                    as Map<String,
                                                        dynamic>)['Duration'];

                                            DateTime d = t.toDate();
                                            DateTime y = x.toDate();

                                            setState(() {
                                              loginButton = true;
                                              logoutButton = false;
                                              change = false;
                                              loading = false;

                                              Future.delayed(
                                                  Duration(seconds: 0), () async {
                                                if ((documentSnapshotEslam
                                                                .data()!
                                                            as Map<String,
                                                                dynamic>)[
                                                        'pause'] !=
                                                    0) {
                                                  Timestamp p =
                                                      (documentSnapshotEslam
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'pause'];
                                                  DateTime P = p.toDate();
                                                  Timestamp c =
                                                      (documentSnapshotEslam
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'resume'];
                                                  DateTime C = c.toDate();
                                                  DateTime BrkD = timeD(C, P);
                                                  DateTime logD = timeD(now, d);
                                                  DateTime totD =
                                                      timeD(logD, BrkD);
                                                  DateTime Dur = totD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          '7BrHBRzfWV6VIMTiKQs1')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  num H = totD.hour;
                                                  num M = totD.minute;
                                                  num S = totD.second;
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                           Timestamp n =
                                             (documentSnapshotEslam.data()! as Map<String, dynamic>)['logout'];
                                                DateTime N = n.toDate();
                                                
                                        String X = DateFormat('EEEE').format(N);
                                        if (X=="Sunday") {
                                                              DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
                                       final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                             
                         
                      FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Sunday.Logout' : DateTime.now(),
    
  }
  );
         final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
  
     Timestamp i =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Logout'];
           Timestamp o =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Login'];
          

   DateTime d = i.toDate();
      DateTime b = o.toDate();
      
       final diff =d.difference(b);
       int n = diff.inHours;
  
  
    int x =
          (snapShot.data()! as Map<String, dynamic>)['Sunday']['Duration'];
          int g= (n+x);
                        FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Sunday.Duration' :g,
    
  }
  );
                                          
                                        }
                                        else if (X=="Monday"){
                                                             DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
                                       final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                             
                         
                      FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Monday.Logout' : DateTime.now(),
    
  }
  );
         final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
  
     Timestamp i =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Logout'];
           Timestamp o =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Login'];
          

   DateTime d = i.toDate();
      DateTime b = o.toDate();
      
       final diff =d.difference(b);
       int n = diff.inHours;
  
  
    int x =
          (snapShot.data()! as Map<String, dynamic>)['Monday']['Duration'];
          int g= (n+x);
                        FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Monday.Duration' :g,
    
  }
  );

                                        }
                                          else if (X=="Tuesday"){
                                 DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
                                       final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                             
                         
                      FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Tuesday.Logout' : DateTime.now(),
    
  }
  );
         final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
  
     Timestamp i =
          (snapShot.data()! as Map<String, dynamic>)['Tuesday']['Logout'];
           Timestamp o =
          (snapShot.data()! as Map<String, dynamic>)['Tuesday']['Login'];
          

   DateTime d = i.toDate();
      DateTime b = o.toDate();
      
       final diff =d.difference(b);
       int n = diff.inHours;
  
  
    int x =
          (snapShot.data()! as Map<String, dynamic>)['Tuesday']['Duration'];
          int g= (n+x);
                        FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Tuesday.Duration' :g,
    
  }
  );
                       

                                        }
                                          else if (X=="Wednesday"){
                                            DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
                                       final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                             
                         
                      FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Wednesday.Logout' : DateTime.now(),
    
  }
  );
         final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
  
     Timestamp i =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Logout'];
           Timestamp o =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Login'];
          

   DateTime d = i.toDate();
      DateTime b = o.toDate();
      
       final diff =d.difference(b);
       int n = diff.inHours;
  
  
    int x =
          (snapShot.data()! as Map<String, dynamic>)['Wednesday']['Duration'];
          int g= (n+x);
                        FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Wednesday.Duration' :g,
    
  }
  );

                                        }
                                          else if (X=="Thursday"){
                                            DateTime now = new DateTime.now();
            int dayOfYear = int.parse(DateFormat("D").format(now));

            
            num y =((dayOfYear - now.weekday + 10) / 7).floor();
                                       final doc=data.doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}');
                                             
                         
                      FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Thursday.Logout' : DateTime.now(),
    
  }
  );
         final snapShot = await 
    FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .get();
  
     Timestamp i =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Logout'];
           Timestamp o =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Login'];
          

   DateTime d = i.toDate();
      DateTime b = o.toDate();
      
       final diff =d.difference(b);
       int n = diff.inHours;
  
  
    int x =
          (snapShot.data()! as Map<String, dynamic>)['Thursday']['Duration'];
          int g= (n+x);
                        FirebaseFirestore.instance.collection('Users').doc('7BrHBRzfWV6VIMTiKQs1').collection('Weeks').doc('Week${y}')// varuId in your case
  .update({
    'Thursday.Duration' :g,
    
  }
  );
                                        }
                                        else{
                                          return print("null");
                                        }
                                                } else {
                                                  DateTime logD = timeD(now, d);

                                                  num H = logD.hour;
                                                  num M = logD.minute;
                                                  num S = logD.second;
                                                  DateTime Dur = logD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          '7BrHBRzfWV6VIMTiKQs1')
                                                      .update({
                                                    'Duration': Dur,
                                                  });

                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                } // print(now.second);
                                                // print(d.second);
                                                // print(S);
                                              });
                                            });
                                            data
                                                .doc('7BrHBRzfWV6VIMTiKQs1')
                                                .update({
                                              'logout': DateTime.now(),
                                              'Logon': 0,
                                              
                                            });
                                          } else if (_dropdownValue ==
                                              'Mahmoud') {
                                            final now = DateTime.now();
                                            Timestamp t =
                                                (documentSnapshotMahmoud.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
                                            DateTime d = t.toDate();
                                            Timestamp x =
                                                (documentSnapshotMahmoud.data()!
                                                    as Map<String,
                                                        dynamic>)['Duration'];
                                            DateTime y = x.toDate();

                                            setState(() {
                                              loginButton = true;
                                              logoutButton = false;
                                              change = false;
                                              loading = false;

                                              Future.delayed(
                                                  Duration(seconds: 0), () {
                                                if ((documentSnapshotMahmoud
                                                                .data()!
                                                            as Map<String,
                                                                dynamic>)[
                                                        'pause'] !=
                                                    0) {
                                                  Timestamp p =
                                                      (documentSnapshotMahmoud
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'pause'];
                                                  DateTime P = p.toDate();
                                                  Timestamp c =
                                                      (documentSnapshotMahmoud
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'resume'];
                                                  DateTime C = c.toDate();
                                                  DateTime BrkD = timeD(C, P);
                                                  DateTime logD = timeD(now, d);
                                                  DateTime totD =
                                                      timeD(logD, BrkD);
                                                  num H = totD.hour;
                                                  num M = totD.minute;
                                                  num S = totD.second;
                                                  DateTime Dur = totD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'JREaX2U9h0J1OlTguAjs')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                } else {
                                                  DateTime logD = timeD(now, d);
                                                  num H = logD.hour;
                                                  num M = logD.minute;
                                                  num S = logD.second;
                                                  DateTime Dur = logD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'JREaX2U9h0J1OlTguAjs')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                }
                                                // print(now.second);
                                                // print(d.second);
                                              });
                                            });
                                            data
                                                .doc('JREaX2U9h0J1OlTguAjs')
                                                .update({
                                              'logout': DateTime.now(),
                                              'Logon': 0,
                                              
                                            });
                                          } else if (_dropdownValue == 'Abdo') {
                                            final now = DateTime.now();
                                            Timestamp t =
                                                (documentSnapshotAbdo.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
                                            DateTime d = t.toDate();
                                            Timestamp x =
                                                (documentSnapshotAbdo.data()!
                                                    as Map<String,
                                                        dynamic>)['Duration'];
                                            DateTime y = x.toDate();

                                            setState(() {
                                              loginButton = true;
                                              logoutButton = false;
                                              change = false;
                                              loading = false;

                                              Future.delayed(
                                                  Duration(seconds: 0), () {
                                                if ((documentSnapshotAbdo
                                                                .data()!
                                                            as Map<String,
                                                                dynamic>)[
                                                        'pause'] !=
                                                    0) {
                                                  Timestamp p =
                                                      (documentSnapshotAbdo
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'pause'];
                                                  DateTime P = p.toDate();
                                                  Timestamp c =
                                                      (documentSnapshotAbdo
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'resume'];
                                                  DateTime C = c.toDate();
                                                  DateTime BrkD = timeD(C, P);
                                                  DateTime logD = timeD(now, d);
                                                  DateTime totD =
                                                      timeD(logD, BrkD);
                                                  DateTime Dur = totD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'cTtofZa7zvPWKvWmVl4q')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  num H = totD.hour;
                                                  num M = totD.minute;
                                                  num S = totD.second;
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                } else {
                                                  DateTime logD = timeD(now, d);
                                                  num H = logD.hour;
                                                  num M = logD.minute;
                                                  num S = logD.second;
                                                  DateTime Dur = logD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'cTtofZa7zvPWKvWmVl4q')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                }
                                                // print(now.second);
                                                // print(d.second);
                                                // print(S);
                                              });
                                            });
                                            data
                                                .doc('cTtofZa7zvPWKvWmVl4q')
                                                .update({
                                              'logout': DateTime.now(),
                                              'Logon': 0,
                                             
                                            });
                                          } else if (_dropdownValue == 'Samy') {
                                            final now = DateTime.now();
                                            Timestamp t =
                                                (documentSnapshotSamy.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
                                            DateTime d = t.toDate();
                                            Timestamp x =
                                                (documentSnapshotSamy.data()!
                                                    as Map<String,
                                                        dynamic>)['Duration'];
                                            DateTime y = x.toDate();

                                            setState(() {
                                              loginButton = true;
                                              logoutButton = false;
                                              change = false;
                                              loading = false;

                                              Future.delayed(
                                                  Duration(seconds: 0), () {
                                                if ((documentSnapshotSamy
                                                                .data()!
                                                            as Map<String,
                                                                dynamic>)[
                                                        'pause'] !=
                                                    0) {
                                                  Timestamp p =
                                                      (documentSnapshotSamy
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'pause'];
                                                  DateTime P = p.toDate();
                                                  Timestamp c =
                                                      (documentSnapshotSamy
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'resume'];
                                                  DateTime C = c.toDate();
                                                  DateTime BrkD = timeD(C, P);
                                                  DateTime logD = timeD(now, d);
                                                  DateTime totD =
                                                      timeD(logD, BrkD);
                                                  num H = totD.hour;
                                                  num M = totD.minute;
                                                  num S = totD.second;
                                                  DateTime Dur = totD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'Ar9k6kZPpgFjJRl7HHbm')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                } else {
                                                  DateTime logD = timeD(now, d);
                                                  num H = logD.hour;
                                                  num M = logD.minute;
                                                  num S = logD.second;
                                                  DateTime Dur = logD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'Ar9k6kZPpgFjJRl7HHbm')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                }
                                              });
                                            });
                                            data
                                                .doc('Ar9k6kZPpgFjJRl7HHbm')
                                                .update({
                                              'logout': DateTime.now(),
                                              'Logon': 0,
                                             
                                            });
                                          } else if (_dropdownValue == 'Zero') {
                                            final now = DateTime.now();
                                            Timestamp t =
                                                (documentSnapshotZero.data()!
                                                    as Map<String,
                                                        dynamic>)['Login'];
                                            DateTime d = t.toDate();
                                            Timestamp x =
                                                (documentSnapshotZero.data()!
                                                    as Map<String,
                                                        dynamic>)['Duration'];
                                            DateTime y = x.toDate();

                                            setState(() {
                                              loginButton = true;
                                              logoutButton = false;
                                              change = false;

                                              Future.delayed(
                                                  Duration(seconds: 0), () {
                                                if ((documentSnapshotEslam
                                                                .data()!
                                                            as Map<String,
                                                                dynamic>)[
                                                        'pause'] !=
                                                    0) {
                                                  Timestamp p =
                                                      (documentSnapshotZero
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'pause'];
                                                  DateTime P = p.toDate();
                                                  Timestamp c =
                                                      (documentSnapshotZero
                                                                  .data()!
                                                              as Map<String,
                                                                  dynamic>)[
                                                          'resume'];
                                                  DateTime C = c.toDate();
                                                  DateTime BrkD = timeD(C, P);
                                                  DateTime logD = timeD(now, d);
                                                  DateTime totD =
                                                      timeD(logD, BrkD);
                                                  DateTime Dur = totD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'NCkpgnEBEUNAtjioS58B')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  num H = totD.hour;
                                                  num M = totD.minute;
                                                  num S = totD.second;
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                } else {
                                                  DateTime logD = timeD(now, d);
                                                  num H = logD.hour;
                                                  num M = logD.minute;
                                                  num S = logD.second;
                                                  DateTime Dur = logD.add(
                                                      Duration(
                                                          hours: y.hour,
                                                          minutes: y.minute,
                                                          seconds: y.second));
                                                  print(Dur);
                                                  data
                                                      .doc(
                                                          'NCkpgnEBEUNAtjioS58B')
                                                      .update({
                                                    'Duration': Dur,
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) =>
                                                          SimpleDialog(
                                                            title: Text(
                                                                '${_dropdownValue} You Have Worked '),
                                                            children: [
                                                              Text(
                                                                  '${H} Hours :${M} Minutes :${S} Seconds')
                                                            ],
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    25),
                                                          ));
                                                }
                                                // print(now.second);
                                                // print(d.second);
                                              });
                                            });
                                            data
                                                .doc('NCkpgnEBEUNAtjioS58B')
                                                .update({
                                              'logout': DateTime.now(),
                                              'Logon': 0,
                                              
                                            });
                                          } else {
                                            _show3Toast(context);
                                          }

                                          setState(() {
                                            // loginButton = true;
                                            // logoutButton = false;
                                            //
                                          });
                                        }
                                      : null,
                                  child: loading
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SpinKitThreeInOut(
                                                size: 45, color: Colors.white),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Text(
                                              'LogOut ',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Icon(Icons.login_outlined),
                                          ],
                                        ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      // minimumSize: Size.fromHeight(50),
                                      shape: StadiumBorder(),
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                logoutButton
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          !change
                                              ? _show2Toast(context)
                                              : setState(
                                                  () async {
                                                    reset();
                                                    stopTimer(resets: false);
                                                    
                                                   startcounter();
                                                    bloaading = true;
                                                    BreakS(context);
                                                    logoutButton = false;
                                                    await Future.delayed(
                                                        Duration(seconds: 0));
                                                    if (_dropdownValue ==
                                                        'Eslam') {
                                                      setState(() {
                                                        bloaading = false;
                                                      });
                                                      data
                                                          .doc(
                                                              '7BrHBRzfWV6VIMTiKQs1')
                                                          .update({
                                                        'pause': DateTime.now(),
                                                        'BreakStart': 1
                                                      });
                                                    } else if (_dropdownValue ==
                                                        'Mahmoud') {
                                                      setState(() {
                                                        bloaading = false;
                                                      });
                                                      data
                                                          .doc(
                                                              'JREaX2U9h0J1OlTguAjs')
                                                          .update({
                                                        'pause': DateTime.now(),
                                                        'BreakStart': 1
                                                      });
                                                    } else if (_dropdownValue ==
                                                        'Abdo') {
                                                      setState(() {
                                                        bloaading = false;
                                                      });
                                                      data
                                                          .doc(
                                                              'cTtofZa7zvPWKvWmVl4q')
                                                          .update({
                                                        'pause': DateTime.now(),
                                                        'BreakStart': 1
                                                      });
                                                    } else if (_dropdownValue ==
                                                        'Samy') {
                                                      setState(() {
                                                        bloaading = false;
                                                      });
                                                      data
                                                          .doc(
                                                              'Ar9k6kZPpgFjJRl7HHbm')
                                                          .update({
                                                        'pause': DateTime.now(),
                                                        'BreakStart': 1
                                                      });
                                                    } else if (_dropdownValue ==
                                                        'Zero') {
                                                      setState(() {
                                                        bloaading = false;
                                                      });
                                                      data
                                                          .doc(
                                                              'NCkpgnEBEUNAtjioS58B')
                                                          .update({
                                                        'pause': DateTime.now(),
                                                        'BreakStart': 1
                                                      });
                                                    } else {
                                                      _showToast(context);
                                                      logoutButton = false;
                                                    }
                                                  },
                                                );
                                          await Future.delayed(
                                              Duration(minutes: 30));
                                          setState(() async {
                                            bloaading = true;
                                            BreakE(context);
                                            await Future.delayed(
                                                Duration(seconds: 2));
                                            if (_dropdownValue == 'Eslam') {
                                              setState(() {
                                                bloaading = false;
                                              });
                                              data
                                                  .doc('7BrHBRzfWV6VIMTiKQs1')
                                                  .update({
                                                'resume': DateTime.now(),
                                                'BreakStart': 0
                                              });
                                            } else if (_dropdownValue ==
                                                'Mahmoud') {
                                              setState(() {
                                                bloaading = false;
                                              });
                                              data
                                                  .doc('JREaX2U9h0J1OlTguAjs')
                                                  .update({
                                                'resume': DateTime.now(),
                                                'BreakStart': 0
                                              });
                                            } else if (_dropdownValue ==
                                                'Abdo') {
                                              setState(() {
                                                bloaading = false;
                                              });
                                              data
                                                  .doc('cTtofZa7zvPWKvWmVl4q')
                                                  .update({
                                                'resume': DateTime.now(),
                                                'BreakStart': 0
                                              });
                                            } else if (_dropdownValue ==
                                                'Samy') {
                                              setState(() {
                                                bloaading = false;
                                              });
                                              data
                                                  .doc('Ar9k6kZPpgFjJRl7HHbm')
                                                  .update({
                                                'resume': DateTime.now(),
                                                'BreakStart': 0
                                              });
                                            } else if (_dropdownValue ==
                                                'Zero') {
                                              setState(() {
                                                bloaading = false;
                                              });
                                              data
                                                  .doc('NCkpgnEBEUNAtjioS58B')
                                                  .update({
                                                'resume': DateTime.now(),
                                                'BreakStart': 0
                                              });
                                            } else {
                                              _showToast(context);
                                              logoutButton = false;
                                            }
                                            logoutButton = true;
                                          });
                                          ;
                                        },
                                        child: bloaading
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SpinKitThreeInOut(
                                                      size: 45,
                                                      color: Colors.white),
                                                  const SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Icon(Icons.food_bank),
                                                  Text(
                                                    '   Start Break',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 20),
                                            // minimumSize: Size.fromHeight(72),
                                            shape: StadiumBorder(),
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          !change
                                              ? _show2Toast(context)
                                              : setState(() {
                                                btimer?.cancel();
                                                countDown=false;
                                                startTimer(resets: false);
                                                  BreakE(context);
                                                  logoutButton = true;
                                                  if (_dropdownValue ==
                                                      'Eslam') {
                                                    setState(() {});
                                                    data
                                                        .doc(
                                                            '7BrHBRzfWV6VIMTiKQs1')
                                                        .update({
                                                      'resume': DateTime.now(),
                                                      'BreakStart': 0
                                                    });
                                                  } else if (_dropdownValue ==
                                                      'Mahmoud') {
                                                    setState(() {});
                                                    data
                                                        .doc(
                                                            'JREaX2U9h0J1OlTguAjs')
                                                        .update({
                                                      'resume': DateTime.now(),
                                                      'BreakStart': 0
                                                    });
                                                  } else if (_dropdownValue ==
                                                      'Abdo') {
                                                    setState(() {});
                                                    data
                                                        .doc(
                                                            'cTtofZa7zvPWKvWmVl4q')
                                                        .update({
                                                      'resume': DateTime.now(),
                                                      'BreakStart': 0
                                                    });
                                                  } else if (_dropdownValue ==
                                                      'Samy') {
                                                    setState(() {});
                                                    data
                                                        .doc(
                                                            'Ar9k6kZPpgFjJRl7HHbm')
                                                        .update({
                                                      'resume': DateTime.now(),
                                                      'BreakStart': 0
                                                    });
                                                  } else if (_dropdownValue ==
                                                      'Zero') {
                                                    setState(() {});
                                                    data
                                                        .doc(
                                                            'NCkpgnEBEUNAtjioS58B')
                                                        .update({
                                                      'resume': DateTime.now(),
                                                      'BreakStart': 0
                                                    });
                                                  } else {
                                                    _showToast(context);
                                                    logoutButton = false;
                                                  }
                                                });
                                        },
                                        child: bloaading
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SpinKitThreeInOut(
                                                      size: 45,
                                                      color: Colors.white),
                                                  const SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Icon(Icons.work_outline),
                                                  Text(
                                                    '   End Break',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blue,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 20),
                                            // minimumSize: Size.fromHeight(72),
                                            shape: StadiumBorder(),
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)))
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DataTable(

                        decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                        columns: [
                        DataColumn(label: Text("Duration", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),)),
                        DataColumn(label: Text("Break", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),)),
                      ], rows:  <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(TimerText()),
                            DataCell(CountText()),
                           
                          ],
                        ),
                      ]),
                     
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
