// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Color(AppColor.bgcolor),
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 150,
              collapsedHeight: 90,
              flexibleSpace: FlexibleSpaceBar(
                background: location(),
              ),
              bottom: PreferredSize(
                preferredSize: Size(0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchform(),
                    typesOption(),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget location() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
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
      ),
    );
  }

  Widget searchform() {
    return Container(
      height: 45,
      width: Get.width * 0.85,
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
            prefixIcon: Icon(
              Icons.search,
              color: Color(AppColor.iconpink),
            )),
      ),
    );
  }

  Widget typesOption() {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 8),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2)
          ],
          color: Color(AppColor.bgcolor)),
      child: Text("Fast Delivery"),
    );
  }
}
