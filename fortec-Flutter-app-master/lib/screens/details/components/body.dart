import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/size_config.dart';
import 'product_description.dart';
import '../../../components/rounded_icon_btn.dart';
import '../components/top_rounded_container.dart';
import 'product_images.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/users.dart';

class Body extends StatefulWidget {
  final ProductModel product;

  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int quantity = 1;
  void _incrementCounter() {
    setState(() {
      quantity = quantity + 1;
    });
  }

  void _decrmentCounter() {
    if (quantity != 1) {
      setState(() {
        quantity -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '$quantity',
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(40)),
                          ),
                          Spacer(),
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: () {
                              _decrmentCounter();
                            },
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          RoundedIconBtn(
                            icon: Icons.add,
                            showShadow: true,
                            press: () {
                              _incrementCounter();
                              print(quantity);
                            },
                          ),
                        ],
                      ),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () async {
                              bool value = await user.addToCard(
                                  product: widget.product, quantity: quantity);
                              if (value) {
                                print('good');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CartScreen(product: widget.product),
                                  ),
                                );
                                return;
                              } else {
                                print("Item NOT added to cart");
                              }
                              print("lOADING SET TO FALSE");
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return Dialog(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 20.0)), //this right here
//                                         child: Container(
//                                           height: 200,
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: <Widget>[
//                                                     Text(
//                                                       'You Need to Register first',
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
