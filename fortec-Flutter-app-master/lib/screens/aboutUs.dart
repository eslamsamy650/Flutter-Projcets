import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

class AboutUs extends StatefulWidget {
  static String routeName = "/aboutUs";
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("About Us"),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.about),
      
    );
  }
}