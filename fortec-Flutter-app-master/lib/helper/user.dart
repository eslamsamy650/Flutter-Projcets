import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  void addToCart({String userId, Map cartItem}) {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem])
    });
  }

  void increasePrice({
    String userId,
    Map cartItem,
  }) {
    double totalCartPrice = 0;

    totalCartPrice += cartItem['totalSale'];
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({"totalPrice": FieldValue.increment(totalCartPrice)});
  }

  void removeFromCart({String userId, Map cartItem}) {
    double totalCartPrice = 0;
    totalCartPrice -= cartItem['totalSale'];
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem]),
      "totalPrice": FieldValue.increment(totalCartPrice),
    });
  }

  // Future<UserModel> getUserById(String id) =>
  //     FirebaseFirestore.instance.collection('users').doc(id).get().then((doc) {
  //       return UserModel.fromSnapshot(doc);
  //     });
}
