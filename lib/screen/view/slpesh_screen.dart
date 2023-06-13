import 'dart:async';

import 'package:demo/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    isLogin = FirebaseHelper.firebaseHelper.checkUser();
  }

  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => isLogin == true
          ? Get.offAndToNamed('/home')
          : Get.offAndToNamed('/signIn'),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 160,
                  ),
                  Text(
                    "Shopping Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
