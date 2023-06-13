import 'package:demo/screen/controller/home_controller.dart';
import 'package:demo/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class productscreen extends StatefulWidget {
  const productscreen({Key? key}) : super(key: key);

  @override
  State<productscreen> createState() => _productscreenState();
}

class _productscreenState extends State<productscreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );
  TextEditingController txtproduct = TextEditingController();
  TextEditingController txtcategory = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtpaytype = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange.shade900,
          title: Text(
            "Add Product",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: txtproduct,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Product",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtcategory,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Category",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtnotes,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Notes",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtdate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Date",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txttime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Time",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtprice,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Price",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtpaytype,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "Paytypes",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    FirebaseHelper.firebaseHelper.insertItem(
                      Product: txtproduct,
                      Category: txtcategory,
                      Notes: txtnotes,
                      Date: txttime,
                      Time: txttime,
                      Price: txtprice,
                      Paytypes: txtpaytype,
                    );
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange.shade900),
                    child: Center(
                      child: Text(
                        "Add Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
