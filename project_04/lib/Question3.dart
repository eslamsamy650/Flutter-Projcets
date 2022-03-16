import 'package:flutter/material.dart';

import 'Thx.dart';
import 'values.dart';


class Question3 extends StatefulWidget {
  final int score ;

  const Question3({
    Key? key,
      required this.score
   }) : super(key: key);

  

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  
  @override
  Widget build(BuildContext context) {
    var x = Values().questions[2]['questionText'];
    List ansr=[ Values().questions[2]['answers']];


    var e = ansr[0][0]['text'];
    var s = ansr[0][1]['text'];
    var l = ansr[0][2]['text'];


     
      
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 3'),
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
                     
                       var secscore= ansr[i][0]['score'];
                      var secondlast =secscore+(widget.score);
                      print(secondlast);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  Question3(score:secondlast)));
                    },
                    child: Text('$e'))),
                  SizedBox(
                    width: 50,
                  ),
                                  SizedBox(width: 100, height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                     
                       var secscore= ansr[i][1]['score'];
                      var secondlast =secscore+(widget.score);
                      print(secondlast);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  Question3(score:secondlast)));
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
                     
                       var secscore= ansr[i][2]['score'];
                      var secondlast =secscore+(widget.score);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  Question3(score:secondlast)));
                    },
                    child: Text('$l'))),
                  SizedBox(
                    width: 50,
                  ),
                                   SizedBox(width: 100, height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                     
                       var secscore= ansr[i][3]['score'];
                      var secondlast =secscore+(widget.score);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  Question3(score:secondlast)));
                    },
                    child: Text('$a'))),

              ],
                )
             
                
              ],
              
            ),
          );
        },
      ),

    );
  }



}