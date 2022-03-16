import 'package:flutter/material.dart';
import 'package:project_01/mainscreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen"),

      ),
      body          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
                },
                    child: Text(
                      "Return",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                
              ],
            )),
    );
  }
}

  