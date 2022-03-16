import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/providers/users.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart/check_out_card.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../models/Product.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  final ProductModel product;

  const CartScreen({Key key, @required this.product}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    User currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      bottomNavigationBar: CheckoutCard(),
      appBar: AppBar(
        actions: [
          Row(
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(
                    color: Color(0xFFFFA53E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
          future: user.getData(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.data()['cart'].length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(
                        snapshot.data.data()['cart'][index]['id'].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        print(widget.product);
                        currentUser.reload();
                        user.removeFromCart(
                          cartItem: snapshot.data.data()['cart'][index],
                          product: widget.product,
                        );
                        snapshot.data.data()['cart'].removeAt(index);
                        currentUser.reload();
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 88,
                          child: AspectRatio(
                            aspectRatio: 0.88,
                            child: Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(10)),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.network(
                                  snapshot.data.data()['cart'][index]['image']),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.data()['cart'][index]['name'],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text.rich(
                              TextSpan(
                                text:
                                    "\L\.\E ${snapshot.data.data()['cart'][index]['price']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                                children: [
                                  TextSpan(
                                      text:
                                          " x${snapshot.data.data()['cart'][index]['quantity']}\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  TextSpan(
                                      text:
                                          "Product total : ${snapshot.data.data()['cart'][index]['totalSale']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("No data");
            }
            return Text('Loading..');
          },
        ),
      ),
    );
  }
}
