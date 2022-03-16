import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/product.dart';
import '../../../components/product_card.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return productProvider.securityCategory.length < 1
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No products Found",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                    ),
                  ),
                ],
              )
            ],
          )
        : Container(
          margin: EdgeInsets.all(10),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, index) =>
                  ProductCard(product: productProvider.securityCategory[index]),
              itemCount: productProvider.securityCategory.length,
            ),
          );
  }
}
