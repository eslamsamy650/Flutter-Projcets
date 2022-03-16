import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import '../size_config.dart';

class Categories extends StatelessWidget {
  static String routeName = "/Categories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.categories),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenWidth(20)),
                    CategoriesCard(
                      image: "assets/images/mostSold.jpg",
                      category: "Most Sold",
                      numOfBrands: 18,
                      press: () {},
                    ),
                    SizedBox(height: getProportionateScreenWidth(20)),
                    CategoriesCard(
                      image: "assets/images/sound.jpg",
                      category: "Sound System",
                      numOfBrands: 24,
                      press: () {},
                    ),
                    SizedBox(height: getProportionateScreenWidth(20)),
                    CategoriesCard(
                      image: "assets/images/cars.jpeg",
                      category: "Cars Components ",
                      numOfBrands: 24,
                      press: () {},
                    ),
                    SizedBox(height: getProportionateScreenWidth(20)),
                    CategoriesCard(
                      image: "assets/images/satalite.jpg",
                      category: "Satellite Products ",
                      numOfBrands: 24,
                      press: () {},
                    ),
                    SizedBox(height: getProportionateScreenWidth(20)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(10),
        right: getProportionateScreenWidth(10),
      ),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenWidth(200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.scaleDown,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15.0),
                        vertical: getProportionateScreenWidth(10),
                      ),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "$category\n",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: "$numOfBrands Brands")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
