// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zomato/Services/database.dart';
import 'package:zomato/Helper/utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Color(AppColor.bgcolor),
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                expandedHeight: 160,
                collapsedHeight: 110,
                flexibleSpace: FlexibleSpaceBar(
                  background: location(),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(0, 0),
                  child: Column(
                    children: [
                      searchform(),
                      SizedBox(height: 10),
                      SizedBox(
                          height: 50,
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.only(left: 2),
                              itemCount: options.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, ind) {
                                return typesOption(text: options[ind]);
                              })),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(headtext: 'Check This Out!'),
                        SizedBox(height: 15),
                        offerAd(),
                        SizedBox(height: 20),
                        textWidget(headtext: 'Eat what makes you happy'),
                        SizedBox(height: 15),
                        itemGrid(),
                        SizedBox(height: 20),
                        textWidget(headtext: 'Quick checkout meals'),
                        SizedBox(height: 15),
                        restaurantsAvalible(),
                      ],
                    );
                  },
                  // childCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget({headtext}) {
    return Text(
      headtext,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget location() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.location_pin,
          size: 32,
          color: Color(AppColor.iconpink),
        ),
        SizedBox(width: 5),
        SizedBox(
          width: Get.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "B-342 Pramukhchhaya society, yogichowk, surat",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Color(AppColor.black),
          backgroundImage:
              AssetImage(AssetsPath.image + 'Snapchat-177622065.jpg'),
        )
      ],
    );
  }

  Widget searchform() {
    return Container(
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.mic,
              color: Color(AppColor.iconpink),
            ),
            hintText: 'Search "pizza"',
            hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            prefixIcon: Icon(
              Icons.search,
              color: Color(AppColor.iconpink),
            )),
      ),
    );
  }

  Widget typesOption({text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2)
          ],
          color: Color(AppColor.bgcolor)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      )),
    );
  }

  Widget offerAd() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 216, 161, 157),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Color(AppColor.black),
                    fontSize: 25,
                  ),
                ),
                Text(
                  "GET 50% OFF \nON FIRST ORDER",
                  style: TextStyle(
                    color: Color(AppColor.black),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Order Now >",
                  style: TextStyle(
                    color: Color(AppColor.black),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: Get.height * 0.12,
            width: Get.height / 6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsPath.image + 'pizza-png-15.png'),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget itemGrid() {
    return Container(
      height: Get.height * 0.28,
      width: Get.width,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: foodItemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: Get.height * 0.08,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        foodItemList[index].image,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  foodItemList[index].name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                )
              ],
            );
          }),
    );
  }

  Widget restaurantsAvalible() {
    return Container(
      height: Get.height * 0.42,
      width: Get.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restaurantList.length,
          itemBuilder: (context, index) {
            return foodcell(index, context);
          }),
    );
  }

  Widget foodcell(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        width: Get.width * 0.6,
        child: Column(
          children: [
            Container(
              height: Get.height / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                    image: AssetImage(restaurantList[index].image),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurantList[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 6, 56, 8),
                          ),
                          child: Center(
                            child: Text(
                              "${restaurantList[index].rating}⋆",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${restaurantList[index].dishname}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${restaurantList[index].price}₹",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${restaurantList[index].price}₹",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 201, 115, 45),
                          ),
                          child: Text(
                            "Checkout >",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
