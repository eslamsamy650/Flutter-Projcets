import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../../../providers/users.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final user = Provider.of<UserProvider>(context);
    final firebaseUser = context.watch<User>();
    return FutureBuilder(
      future: user.getData(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && firebaseUser != null ) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text:
                            "Name: ${snapshot.data.data()['firstName'] ?? 'firstName'} ${snapshot.data.data()['lastName'] ?? 'lastName'} \n",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      ),
                      TextSpan(
                            text:
                                "Email: ${snapshot.data.data()['email'] ?? 'Email'} \n",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue),
                          ) ??
                          TextSpan(
                              text:
                                  '${user.googleSignIn.currentUser.email} \n'),
                      TextSpan(
                        text:
                            "ID: ${snapshot.data.data()['uid'] ?? 'Your ID'} \n",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      ),
                      TextSpan(
                        text:
                            "Phone No.: ${snapshot.data.data()['phoneNumber'] ?? 'Your Mobile Number'} \n",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.none || firebaseUser == null) {
          return Text("Check Connection or Register to Continue");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
