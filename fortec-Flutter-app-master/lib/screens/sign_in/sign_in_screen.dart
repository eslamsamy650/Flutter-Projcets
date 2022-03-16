import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Body(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, HomeScreen.routeName);
        },
        label: const Text('Continue Without Register'),
        backgroundColor: Color(0xFFFFA53E),
      ),
    );
  }
}
