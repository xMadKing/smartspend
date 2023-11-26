import 'package:flutter/material.dart';
import 'package:smartspend/pages/onboardingpage.dart';

void main() {
  runApp(MaterialApp(
    home: BoardingPage(
      title: "SmartSpend",
    ),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}
