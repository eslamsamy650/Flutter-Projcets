import 'package:flutter/material.dart';
import 'package:project_05/theme.dart';
import 'Question1.dart';
import 'Name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  



  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:theme(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title:Text("Home Page "),
        automaticallyImplyLeading: false,
        
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text('Welcome Student ',style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) =>name() ));
            }, 
            child: Text('Join Quiz', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)

            
          ],
        ), 
)
,
    );
  }
}


















