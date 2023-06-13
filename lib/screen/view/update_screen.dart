import 'dart:io';

import 'package:demo/screen/controller/home_controller.dart';
import 'package:demo/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );
  var product;
  var category;
  var notes;
  var date;
  var time;
  var price;
  var paytypes;
  var imagepath;
  var image;

  @override
  void initState() {
    super.initState();
    product = homeController.dataList[0].product;
    category = homeController.dataList[0].category;
    notes = homeController.dataList[0].notes;
    date = homeController.dataList[0].date;
    time = homeController.dataList[0].time;
    price = homeController.dataList[0].price;
    paytypes = homeController.dataList[0].paytypes;
    image = homeController.dataList[0];
  }

  Widget build(BuildContext context) {
    TextEditingController productc = TextEditingController(text: "$product");
    TextEditingController categoryc = TextEditingController(text: "$category");
    TextEditingController pricec = TextEditingController(text: "$price");
    TextEditingController datec = TextEditingController(text: "$date");
    TextEditingController timec = TextEditingController(text: "$time");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange.shade900,
          title: Text(
            "Update Data",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Text(
                    "Product Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                        Icon(
                          Icons.devices_other,
                          color: Colors.black,
                          size: 30,
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
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: productc,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Laptop,Mobile,A/c...",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Text(
                    "Product Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.black,
                          size: 30,
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
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: pricec,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "10000,20000,30000...",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Text(
                    "Product Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                        Icon(
                          Icons.description,
                          color: Colors.black,
                          size: 30,
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
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: datec,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "16/06/2023",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Text(
                    "Product Time",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                        Icon(
                          Icons.campaign,
                          color: Colors.black,
                          size: 30,
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
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: timec,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "5:00",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Text(
                    "Product Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Icon(
                          Icons.category,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Container(
                          height: double.infinity,
                          width: 3,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: homeController.selectedUCategory.value,
                          items: homeController.uCategoryList
                              .map(
                                (element) => DropdownMenuItem(
                                  child: Text(element),
                                  value: element,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            homeController.selectedUCategory.value = value!;
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          dropdownColor: Colors.white,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Text(
                    "Product Image",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        homeController.uImagePath.value.isEmpty
                            ? Image.file(
                                File(image),
                                height: 150,
                                width: 150,
                              )
                            : Image.file(
                                File(
                                  homeController.uImagePath.value,
                                ),
                                height: 150,
                                width: 150,
                              ),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () async {
                            ImagePicker imagePicker = ImagePicker();
                            XFile? xFile = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                            );
                            homeController.uImagePath.value = xFile!.path;
                          },
                          child: Container(
                            height: 50,
                            width: 220,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 1,
                              ),
                              child: Text(
                                "Update Image",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    FirebaseHelper.firebaseHelper.updateItem(
                      Product: product,
                      Date: datec.text,
                      Price: pricec.text,
                      Time:timec.text,
                      Category: homeController.selectedUCategory.value,
                     image: homeController.uImagePath.value,
                    );
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
