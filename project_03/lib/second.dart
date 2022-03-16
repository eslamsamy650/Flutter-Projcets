import 'package:flutter/material.dart';
import 'package:project_03/main.dart';

class second extends StatelessWidget {
  const second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),

      ),
      body : Center(
              child: Column(
                
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('2'),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen() ));
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

  