import 'package:flutter/material.dart';

import 'package:project_02/main.dart';



class YourAge extends StatelessWidget {
  const YourAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Counter'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                        Text(
              ' Your Age ',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              'Nothing Yet ',
              style: Theme.of(context).textTheme.headline4,
            ),
          
            ],
          ),
 
       
    ),
     floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
     
      FloatingActionButton(           
        child: Icon(
          Icons.arrow_back
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: ' Counter')));
        },
        heroTag: null,
      ),
      
    ]
          ),
    );
  }
}