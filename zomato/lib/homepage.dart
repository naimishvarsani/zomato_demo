// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zomato/database.dart';
import 'package:zomato/utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  int currenIndex = 0;

  final List<String> options = [
    "Pro",
    "Rating: 4.0+",
    "Max Saftey",
    "Fastest Delivery",
    "Offers",
    "TakeAway",
    "Popular"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(226, 56, 70, 1),
        selectedIconTheme: IconThemeData(color: Color.fromRGBO(226, 56, 70, 1)),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currenIndex,
        onTap: (val) {
          setState(() {
            currenIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delivery_dining,
              color: Colors.black,
            ),
            label: "Delivery",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood_rounded,
              color: Colors.black,
            ),
            label: "Dining",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on,
              color: Colors.black,
            ),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.black,
            ),
            label: "Wallet",
          ),
        ],
      ),
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
                    return Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(headtext: 'Check This Out!'),
                          SizedBox(height: 15),
                          offerAd(),
                          SizedBox(height: 20),
                          textWidget(headtext: 'Eat what makes you happy'),
                          SizedBox(height: 15),
                          itemGrid(),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
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
        style: TextStyle(fontSize: 10),
      )),
    );
  }

  Widget offerAd() {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      height: Get.height / 2.7,
      width: Get.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(226, 56, 70, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: Get.height / 6,
              width: Get.height / 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AssetsPath.image + 'pizza-png-15.png'),
                ),
              ),
            ),
          ),
          Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Text(
            "GET 50% OFF \nON FIRST ORDER",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            "Order Now >",
            // textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemGrid() {
    return Container(
      height: Get.height / 3,
      width: Get.width,
      child: GridView.builder(
          itemCount: foodItemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: Get.height * 0.09,
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                )
              ],
            );
          }),
    );
  }
}
