import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const IsFavorite = "isFavorite";
  static DateTime CREATED_AT = DateTime.now();
  static const FIRSTNAME = "firstName";
  static const SECONDNAME = "secondName";

  String _id;
  String _userId;
  String _firstName;
  String _secondName;
  bool _isFavorite;
  DateTime _createdAt;
  int _total;

//  getters
  String get id => _id;
  String get userId => _userId;
  bool get isFavorite => _isFavorite;
  String get firstName => _firstName;
  String get secondName => _secondName;
  int get total => _total;
  DateTime get createdAt => _createdAt;

  // public variable
  List cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _total = snapshot.data()[TOTAL];
    _isFavorite = snapshot.data()[IsFavorite];
    _firstName = snapshot.data()[FIRSTNAME];
    _secondName = snapshot.data()[SECONDNAME];
    _userId = snapshot.data()[USER_ID];
    _createdAt = snapshot.data()[CREATED_AT];
    cart = snapshot.data()[CART];
  }
}
