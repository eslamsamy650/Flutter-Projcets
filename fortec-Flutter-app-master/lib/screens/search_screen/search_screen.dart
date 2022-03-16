import 'package:flutter/material.dart';
import './body.dart';
import '../../screens/cart/cart_screen.dart';

class ProductSearchScreen extends StatelessWidget {
  static String routeName = "/Search";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Search Results'),
          elevation: 0.0,
          // centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(product: null,),
                    ),
                  );
                })
          ],
        ),
        body: Body()
        //  productProvider.productsSearched.length < 1
        //     ? Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               Icon(
        //                 Icons.search,
        //                 color: Colors.grey,
        //                 size: 30,
        //               ),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 15,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               Text(
        //                 "No products Found",
        //                 style: TextStyle(
        //                   color: Colors.grey,
        //                   fontWeight: FontWeight.w300,
        //                   fontSize: 22,
        //                 ),
        //               ),
        //             ],
        //           )
        //         ],
        //       )
        //     : ListView.builder(
        //         itemCount: productProvider.productsSearched.length,
        //         itemBuilder: (context, index) {
        //           return Text(productProvider.productsSearched[index].name);
        //         }),
        // changeScreen(
        //     context,
        //     Details(
        //         product:
        //             productProvider.productsSearched[index]));
        // },
        // child: ProductWidget(
        //     product: productProvider.productsSearched[index]));
        );
  }
}
