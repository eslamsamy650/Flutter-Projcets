import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order.dart';

class OrderServices {
  String collection = "orders";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder({
    String userId,
    String id,
    String status,
    String firstName,
    String lastName,
    String email,
    List cart,
    double totalPrice,
  }) {
    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "cart": cart,
      "totalPrice": totalPrice,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "createdAt": DateTime.now(),
      "status": status
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({"totalPrice": 0});
    });
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
