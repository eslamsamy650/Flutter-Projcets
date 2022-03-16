import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/users.dart';
import '../../helper/order.dart';
import 'package:uuid/uuid.dart';
import '../../size_config.dart';
import '../../screens/ThankYou/thankyou.dart';
import '../../loading.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
    this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    User currentUser = FirebaseAuth.instance.currentUser;
    final user = Provider.of<UserProvider>(context);
    OrderServices _orderServices = OrderServices();
    return FutureBuilder(
        future: user.getData(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(15),
                horizontal: getProportionateScreenWidth(30),
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 20,
                    color: Color(0xFFDADADA).withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('*Swipe left to delete the product'),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Total:\n",
                            children: [
                              TextSpan(
                                text:
                                    "\L\.\E ${snapshot.data.data()['totalPrice']}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(190),
                          child: DefaultButton(
                            text: "Check Out",
                            press: () {
                              if (snapshot.data.data()['totalPrice'] == 0) {
                                return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20.0)), //this right here
                                        child: Container(
                                          height: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Your cart is empty',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }
                              if (snapshot.data.data()['totalPrice'] != 0)
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20.0)), //this right here
                                        child: Container(
                                          height: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Confirm your orders with \L\.\E ${snapshot.data.data()['totalPrice']} !\n',
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  width: 300.0,
                                                  child: DefaultButton(
                                                    press: () async {
                                                      var uuid = Uuid();
                                                      String id = uuid.v4();
                                                      _orderServices.createOrder(
                                                          userId:
                                                              currentUser.uid,
                                                          firstName: snapshot
                                                                  .data
                                                                  .data()[
                                                              'firstName'],
                                                          email: snapshot.data
                                                              .data()['email'],
                                                          lastName: snapshot
                                                                  .data
                                                                  .data()[
                                                              'lastName'],
                                                          id: id,
                                                          status: "Complete",
                                                          totalPrice: snapshot
                                                                  .data
                                                                  .data()[
                                                              'totalPrice'],
                                                          cart: snapshot.data
                                                              .data()['cart']);
                                                      snapshot.data.data()[
                                                          'totalPrice'] = 0;
                                                      for (Map cartItem
                                                          in user.cart) {
                                                        bool value = await user
                                                            .removeFromCart(
                                                                cartItem:
                                                                    cartItem);
                                                        if (value) {
                                                          currentUser.reload();
                                                        } else {
                                                          print(
                                                              "ITEM WAS NOT REMOVED");
                                                        }
                                                      }
                                                      Navigator.pop(context);
                                                      Navigator.pushNamed(
                                                          context,
                                                          ThankYou.routeName);
                                                      return;
                                                    },
                                                    text: "Confirm",
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                SizedBox(
                                                  width: 300.0,
                                                  child: SecondaryButton(
                                                    press: () {
                                                      Navigator.pop(context);
                                                      currentUser.reload();
                                                    },
                                                    text: "Back",
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text("No data");
          }
          return Loading();
        });
  }
}
