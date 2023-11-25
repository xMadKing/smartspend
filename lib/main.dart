import 'package:flutter/material.dart';
import 'package:smartspend/passpage.dart';
import 'package:smartspend/onboardingpage.dart';

void main() {
  runApp(MaterialApp(
    home: BoardingPage(
      title: "SmartSpend",
    ),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}
