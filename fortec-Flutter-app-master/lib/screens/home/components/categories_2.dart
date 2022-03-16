import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/categories/Network/network.dart';
import 'package:shop_app/screens/categories/Sound/sound.dart';
import 'package:shop_app/screens/categories/Accessories/Accessories.dart';
import 'package:shop_app/screens/categories/other/other.dart';

import '../../../size_config.dart';

class CategoriesTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryCard(
              icon: "assets/icons/network.svg",
              text: "Network",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NetworkScreen(),
                  ),
                );
              },
            ),
             CategoryCard(
              icon: "assets/icons/sound.svg",
              text: "Sound",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SoundScreen(),
                  ),
                );
              },
            ),
             CategoryCard(
              icon: "assets/icons/security.svg",
              text: "Accessory",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccessoriesScreen(),
                  ),
                );
              },
            ),
             CategoryCard(
              icon: "assets/icons/other.svg",
              text: "Other",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherScreen(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(70),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(70),
              width: getProportionateScreenWidth(70),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
