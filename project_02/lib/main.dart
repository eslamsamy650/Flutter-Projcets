import 'package:flutter/material.dart';
import 'yourage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ' Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  

  }

   void _zerCounter(){
    setState(() {
      _counter=0;
    });
  

  }
  

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: loading
          ? Container(
              child: Center(
                  child: Text(
                '$_counter',
                style: TextStyle(fontSize: 38.0),
              )),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
            Text(
              'Please Put Your Age ',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              '$_counter',
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
          Icons.add
        ),
        onPressed: _incrementCounter,
        heroTag: null,
      ),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(           
        child: Icon(
          Icons.remove
        ),
        onPressed: _decrementCounter,
        heroTag: null,
      ),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(           
        child: Text(
          '0'
        ),
        onPressed: _zerCounter,
        heroTag: null,
      ),
            SizedBox(
        height: 10,
      ),
      FloatingActionButton(           
        child: Text(
          'OK'
        ),
        onPressed: () {
           setState(() {
             loading = !loading;
           });
        },
        heroTag: null,
      )
    ]
            ));
   
  }
}
