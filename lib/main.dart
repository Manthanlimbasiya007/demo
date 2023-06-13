import 'package:demo/screen/view/home_screen.dart';
import 'package:demo/screen/view/product_screen.dart';
import 'package:demo/screen/view/signin_screen.dart';
import 'package:demo/screen/view/signup_screen.dart';
import 'package:demo/screen/view/slpesh_screen.dart';
import 'package:demo/screen/view/update_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => SpleshScreen(),
        ),
        GetPage(
          name: '/signIn',
          page: () => SignInScreen(),
        ),
        GetPage(
          name: '/signUp',
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/product',
          page: () => productscreen(),
        ),
        GetPage(
          name: '/update',
          page: () => UpdateScreen(),
        ),
      ],
    ),
  );
}
