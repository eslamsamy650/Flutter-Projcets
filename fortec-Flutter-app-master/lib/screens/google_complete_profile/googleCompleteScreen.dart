import 'package:flutter/material.dart';

import 'components/body.dart';

class GoogleCompleteProfileScreen extends StatelessWidget {
  final String email;
  final String uid;

  GoogleCompleteProfileScreen({
    this.uid,
    this.email,
  });
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Body(email: email,));
  }
}
