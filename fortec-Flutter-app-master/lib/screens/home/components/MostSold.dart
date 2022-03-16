import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:provider/provider.dart';
import '../../../providers/product.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import '../../categories/mostSold/MostSoldScreen.dart';

class MostSold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Most Sold",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MostSoldScreen()),
                );
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                productProvider.mostSoldCategory.length,
                (index) {
                  return ProductCard(
                      product: productProvider.mostSoldCategory[index]);

                  // return SizedBox
                  // .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
