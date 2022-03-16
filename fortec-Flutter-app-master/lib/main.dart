import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/theme.dart';
import 'package:provider/provider.dart';
import './providers/users.dart';
import './providers/app.dart';
import './providers/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './providers/Auth_Wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserProvider>(
          create: (_) => UserProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<UserProvider>().authStateChanges,
        ),
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ForTech',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: AuthenticationWrapper.routeName,
        routes: routes,
      ),
    );
  }
}
