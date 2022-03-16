import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.product.image,
                height: 126,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
