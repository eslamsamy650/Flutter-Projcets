import 'package:flutter/material.dart';
import '../../../providers/app.dart';
import 'package:provider/provider.dart';
import '../../../providers/product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../search_screen/search_screen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onSubmitted: (pattern) async {
          if (app.search == SearchBy.PRODUCTS) {
            await productProvider.search(productName: pattern);
            Navigator.pushNamed(
              context,
              ProductSearchScreen.routeName,
            );
          }
        },
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
