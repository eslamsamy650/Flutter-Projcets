import 'package:flutter/material.dart';
import 'package:project_05/main.dart';
import 'values.dart';
import 'Question3.dart';

class Question2 extends StatefulWidget {
  final int score ;

  const Question2({
    Key? key,
      required this.score
   }) : super(key: key);

  

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  

  @override
  Widget build(BuildContext context) {
    
    var x = Values().questions[1]['questionText'];
    List ansr=[ Values().questions[1]['answers']];


    
  

     
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 2'),
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
                Image(image: AssetImage('assets/images.png')
                ),
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
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
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
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
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
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
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




