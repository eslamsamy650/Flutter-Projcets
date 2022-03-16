import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import '../../categories/Satalite/satallite.dart';
import '../../categories/Security/security.dart';
import '../../categories/Electronics/electronics.dart';
import 'package:shop_app/screens/categories/tv/tv.dart';

import '../../../size_config.dart';

class CategoriesOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryCard(
              icon: "assets/icons/tv.svg",
              text: "TV",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TvScreen(),
                  ),
                );
              },
            ),
             CategoryCard(
              icon: "assets/icons/satellite.svg",
              text: "Satalite",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SatalliteScreen(),
                  ),
                );
              },
            ),
             CategoryCard(
              icon: "assets/icons/security.svg",
              text: "Security",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecurityScreen(),
                  ),
                );
              },
            ),
             CategoryCard(
              icon: "assets/icons/electronic.svg",
              text: "Electronic",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ElectronicsScreen(),
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
              child: SvgPicture.asset(icon,),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
