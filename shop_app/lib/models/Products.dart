import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  


  late String _id;
  late String _name;
  late String _category;
  late String _image;
  late String _description;
  late double _price;


  String get id => _id;

  String get name => _name;
 
  String get category => _category;

  String get description => _description;

  String get image => _image;

  double get price => _price;

  

  // public variable
  bool liked = false;
  

  ProductModel.fromSnapshot(DocumentSnapshot snapshot,) {
    _id = (snapshot.data()as Map<String, dynamic>)[ID];
    _image = (snapshot.data()as Map<String, dynamic>)[IMAGE];
    _description = (snapshot.data()as Map<String, dynamic>)[DESCRIPTION];
    _price = (snapshot.data()as Map<String, dynamic>)[PRICE];
    _category = (snapshot.data()as Map<String, dynamic>)[CATEGORY];  
    _name = (snapshot.data()as Map<String, dynamic>)[NAME];
  }
}