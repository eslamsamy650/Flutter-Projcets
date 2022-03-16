

import 'package:flutter/material.dart';
import 'package:project_04/main.dart';
import 'my_drawer_header.dart';
import 'values.dart';
import 'Question2.dart';
import 'main.dart';

class Question1 extends StatefulWidget {
  final String score ;

  const Question1({
    Key? key,
      required this.score
   }) : super(key: key);

  

  @override
  State<Question1> createState() => _Question1State();
}


class _Question1State extends State<Question1> {
  @override
  Widget build(BuildContext context) {
    var x = Values().questions[0]['questionText'];

    List ansr = [Values().questions[0]['answers']];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question 1'),
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: ansr.length,
        itemBuilder: (BuildContext context, int i) {
          var e = ansr[i][0]['text'];
          var s = ansr[i][1]['text'];
          var l = ansr[i][2]['text'];
          var a = ansr[i][3]['text'];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                SizedBox(height:50,),
                   Text(
                  '$x',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                                    SizedBox(width: 100, height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      var score = ansr[i][0]['score'];
                      print(score);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question2(score: score)));
                    },
                    child: Text('$e'))),
                  SizedBox(
                    width: 50,
                  ),
                                    SizedBox(width: 100, height: 100,
                  child: ElevatedButton(
                     onPressed: () {
                      var score = ansr[i][1]['score'];
                      print(score);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question2(score: score)));
                    },
                    child: Text('$s'))),

              ],

                ),
                SizedBox(height: 40,),
                     Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SizedBox(width: 100, height: 100,
                  child: ElevatedButton(
                     onPressed: () {
                      var score = ansr[i][2]['score'];
                      print(score);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question2(score: score)));
                    },
                    child: Text('$l'))),
                  SizedBox(
                    width: 50,
                  ),
                                    SizedBox(width: 100, height: 100,
                  child: ElevatedButton(
                      onPressed: () {
                      var score = ansr[i][3]['score'];
                      print(score);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question2(score: score)));
                    },
                    child: Text('$a'))),

              ],
                )
             
                
              ],
              
            ),
          );
        },
      ),
      drawer: Drawer(
        child:SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
              MyHeaderDrawer(),
               InkWell(
               onTap: () {
                  },
                child: Padding(padding: EdgeInsets.all(15),
                  child: Row(
                         children: [
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.person,size: 30,color: Colors.black,),),
                          Expanded(child: Text(widget.score,style: TextStyle(fontSize: 16,color: Colors.black),),),
         
         
        ],
      ),),
    ),
              
              ],
            ),
          ),
        ) ,),
    );
  }



}


