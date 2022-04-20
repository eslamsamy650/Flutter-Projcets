import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatelessWidget {
  NewArrivalProducts({
    Key? key,
  }) : super(key: key);
  final database =
      FirebaseFirestore.instance.collection('Products').snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Products').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  print("eslam");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  
                  height: 200,
                  width: 500,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      String name =
                          (document.data()! as Map<String, dynamic>)['NAME'];
                      int price =
                          (document.data()! as Map<String, dynamic>)['PRICE'];

                      print(name);
                      return Row(
                        children: List.generate(
                          demo_product.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: defaultPadding),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 154,
                                padding: const EdgeInsets.all(defaultPadding / 2),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(defaultBorderRadius)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(defaultBorderRadius)),
                                      ),
                                      child: Image.network(
                                        (document.data()!
                                            as Map<String, dynamic>)['IMAGE'],
                                        height: 132,
                                      ),
                                    ),
                                    const SizedBox(height: defaultPadding / 2),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(width: defaultPadding / 4),
                                        Text(
                                          "\$" + price.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ))
      ],
    );
  }
}
