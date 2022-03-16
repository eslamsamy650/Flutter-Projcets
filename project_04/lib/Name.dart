import 'package:flutter/material.dart';
import 'package:project_04/Question1.dart';

class name extends StatefulWidget {
  name({Key? key}) : super(key: key);

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  TextEditingController _namecontoller = TextEditingController();
  var _nameError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uesr Name '),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Put Your Name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                
                controller: _namecontoller,
                decoration: InputDecoration(
                  
                  hintText: "Your Name ",
                  labelText: "Name",
                  errorText: _nameError,
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.blue,
                  filled: true,
                ),
                maxLines: 3,
                maxLength: 10,
                
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  
                  print(_namecontoller.text);
                  setState(() {
                    if (_namecontoller.text.length<4)
                    _nameError="Enter at least 4 char";
                    else
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Question1(score:_namecontoller.text)));
                      _nameError=null;
                      
                    
                    
                    
                    
                  });
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
