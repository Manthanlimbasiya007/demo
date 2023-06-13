import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screen/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/firebase_helper.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade900,
          centerTitle: true,
          title: Text(
            "Home Screen",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseHelper.firebaseHelper.signOut();
              },
              icon: Icon(Icons.logout),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () async {
                Get.toNamed('/product');
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        backgroundColor: Color(0xfffef2fe),
        body: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Color(0xffd7a5d3),
                      size: 40,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                            ),
                            child: Text(
                              "Shopping Cart",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xffd7a5d3),
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseHelper.firebaseHelper.readItem(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          List<HomeModal> dataList = [];
                          QuerySnapshot? snapData = snapshot.data;
                          for (var x in snapData!.docs) {
                            Map? data = x.data() as Map;
                            String product = data['product'];
                            String category = data['category'];
                            String notes = data['notes'];
                            String date = data['date'];
                            String time = data['time'];
                            String price = data['price'];
                            String paytypes = data['paytypes'];
                            String image = data['image'];
                            HomeModal homeModel = HomeModal(
                              category: category,
                              date: date,
                              notes: notes,
                              paytypes: paytypes,
                              price: price,
                              product: product,
                              time: time,
                              image: image,
                            );
                            dataList.add(homeModel);
                          }
                          return dataList.isEmpty
                              ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        Get.toNamed('/product');
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xfffef2fe),
                                      ),
                                      backgroundColor: Color(0xffd7a5d3),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          homeController.dataList.clear();
                                          var product = dataList[index].product;
                                          var category = dataList[index].category;
                                          var notes = dataList[index].notes;
                                          var date = dataList[index].date;
                                          var time = dataList[index].time;
                                          var price = dataList[index].price;
                                          var paytypes =
                                              dataList[index].paytypes;
                                          UpdateModal updateModel = UpdateModal(
                                            category: category,
                                            date: date,
                                            notes: notes,
                                            paytypes: paytypes,
                                            price: price,
                                            product: product,
                                            time: time,
                                          );
                                          homeController.dataList
                                              .add(updateModel);
                                          homeController
                                                  .selectedUCategory.value =
                                              "${homeController.dataList[0].category}";
                                          Get.toNamed('/update');
                                        },
                                        onDoubleTap: () {
                                          var paytypes =
                                              dataList[index].paytypes;
                                          FirebaseHelper.firebaseHelper
                                              .deleteItem(
                                            paytypes: paytypes,
                                          );
                                        },
                                        onLongPress: () {
                                          Get.toNamed('/product');
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color(0xffd7a5d3),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  alignment: Alignment.center,
                                                  child:
                                                      dataList[index].image ==
                                                              null
                                                          ? Image.asset(
                                                              "assets/images/2.png",
                                                              height: 150,
                                                              width: 150,
                                                            )
                                                          : Image.memory(
                                                              base64Decode(
                                                                dataList[index]
                                                                    .image
                                                                    .toString(),
                                                              ),
                                                              width: 150,
                                                              height: 150,
                                                            ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                  ),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: 3,
                                                    color: Color(0xfffef2fe),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${dataList[index].product}",
                                                          style: TextStyle(
                                                            color: Color(
                                                                    0xfffef2fe)
                                                                .withOpacity(
                                                                    0.6),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          "₹${dataList[index].price}.00",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xfffef2fe),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          "${dataList[index].category}",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xfffef2fe),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffd7a5d3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
