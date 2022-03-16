import 'package:flutter/material.dart';
import 'package:project_04/main.dart';


class Thx extends StatefulWidget {
  final int score ;

  const Thx({
    Key? key,
      required this.score
   }) : super(key: key);

  

  @override
  State<Thx> createState() => _ThxState();
}

class _ThxState extends State<Thx> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title:Text("Final Page "),
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
            Text('Thank You Your Score is : ',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 15,
            ),
            Text('${widget.score }',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
            }, 
            child: Text('Back Home', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)

            
          ],
        ), 
)
,
    );
  }
}










