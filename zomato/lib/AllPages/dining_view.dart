// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DiningView extends StatelessWidget {
  const DiningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "Dining View",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
