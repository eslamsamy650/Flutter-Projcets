import 'package:shop_app/screens/cart/cart_screen.dart';
import 'screens/search_screen/search_screen.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import './providers/Auth_Wrapper.dart';
import './screens/aboutUs.dart';
import './screens/ThankYou/thankyou.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  AuthenticationWrapper.routeName :(context)=> AuthenticationWrapper(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ThankYou.routeName: (context) => ThankYou(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (_) => HomeScreen(),
  Categories.routeName : (context) => Categories(),
  AboutUs.routeName : (context) => AboutUs(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(product: null,),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProductSearchScreen.routeName:(context) => ProductSearchScreen()
  
};
