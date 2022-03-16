import 'package:flutter/material.dart';

import 'components/body.dart';

class ThankYou extends StatelessWidget {
  static String routeName = "/thankyou";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Thank You"),
      ),
      body: Body(),
    );
  }
}
