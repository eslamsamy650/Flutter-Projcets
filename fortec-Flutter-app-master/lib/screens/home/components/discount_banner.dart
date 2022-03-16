import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/product.dart';
import '../../../components/product_card.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
          child: CarouselSlider.builder(
            options: CarouselOptions(height: 150.0),
            itemCount: productProvider.offersCategory.length,
            itemBuilder: (_, index) => Container(
              child: Image.network(
                productProvider.offersCategory[index].image,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
        ) ??
        CircularProgressIndicator();
  }
}
