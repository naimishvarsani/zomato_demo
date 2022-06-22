// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zomato/AllPages/dining_view.dart';
import 'package:zomato/AllPages/homepage.dart';
import 'package:zomato/AllPages/offer.dart';
import 'package:zomato/AllPages/wallet.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  List screens = [
    HomePage(),
    DiningView(),
    OtherView(),
    WalletView(),
  ];
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(226, 56, 70, 1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currenIndex,
        onTap: (val) {
          setState(() {
            currenIndex = val;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delivery_dining,
            ),
            label: "Delivery",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood_rounded,
            ),
            label: "Dining",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on,
            ),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
            ),
            label: "Wallet",
          ),
        ],
      ),
    );
  }
}
