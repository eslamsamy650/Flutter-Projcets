import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/categories_2.dart';
import '../../../size_config.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'MostSold.dart';
import 'displayCategory.dart';
import './categories_1.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            CategoriesOne(),
            DisplayCategory(),
            SizedBox(height: getProportionateScreenWidth(30)),
            CategoriesTwo(),
            MostSold(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
