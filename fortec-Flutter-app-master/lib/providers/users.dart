import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/helper/order.dart';
import 'package:shop_app/helper/user.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/order.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  final FirebaseAuth _auth;
  UserProvider(this._auth);

  final GoogleSignIn googleSignIn = GoogleSignIn();

  User user = FirebaseAuth.instance.currentUser;
  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Status _status = Status.Uninitialized;
  Status get status => _status;

  List<OrderModel> orders = [];

  final formkey = GlobalKey<FormState>();

  UserServices _userServicse = UserServices();
  OrderServices _orderServices = OrderServices();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();

  double totalCartPrice = 0;
  String title;
  DateTime date = DateTime.now();
  List cart = [];
  int numofItems = 0;
  ProductModel product;
  int quantity;

  Future<DocumentSnapshot> getData() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get();
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((value) {
        FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
          'cart': cart,
          'firstName': firstName.text,
          'lastName': lastName.text,
          'email': email.text,
          'password': password.text,
          'uid': value.user.uid,
          'phoneNumber': phoneNumber.text,
          'city': city.text,
          'totalPrice': totalCartPrice,
          'createdAt' : DateTime.now()
        });
      });

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    _status = Status.Unauthenticated;

    notifyListeners();
  }

  Future googleSignOut() async {
    await googleSignIn.signOut();
    _status = Status.Unauthenticated;
  }

  Future<bool> addToCard({ProductModel product, int quantity}) async {
    String userId = FirebaseAuth.instance.currentUser.uid;

    try {
      var uuid = Uuid();
      Map cartItem;
      String cartItemId = uuid.v1();
      cart.add(cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.image,
        "totalSale": product.price * quantity,
        "productId": product.id,
        "price": product.price,
        "quantity": quantity
      });

      _userServicse.addToCart(userId: userId, cartItem: cartItem);
      _userServicse.increasePrice(userId: userId, cartItem: cartItem);
      numofItems++;
      // totalCartPrice += cartItem['totalSale'];

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
    print('signInWithGoogle succeeded: $user');
    print(user);
    return true;
  }

  Future googleAddData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(googleSignIn.currentUser.id)
        .set({
      'cart': cart,
      'firstName': firstName.text,
      'lastName': lastName.text,
      'email': googleSignIn.currentUser.email,
      'password': 'Google Login',
      'city': city.text,
      'uid': googleSignIn.currentUser.id,
      'phoneNumber': phoneNumber.text,
    });
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: user.uid);
    notifyListeners();
  }

  Future<bool> removeFromCart({Map cartItem, ProductModel product}) async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    // totalCartPrice -= product.price * quantity;
    print(totalCartPrice);
    print("THE PRODUC IS: ${cartItem.toString()}");

    try {
      _userServicse.removeFromCart(
        userId: userId,
        cartItem: cartItem,
      );
      print(product.price);

      // totalCartPrice -= cartItem['totalSale'];
      numofItems--;
      // print(numofItems);
      print(totalCartPrice);

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
}
