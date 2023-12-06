import 'package:flutter/material.dart';
import 'package:smartspend/pages/onboardingpage.dart';
import 'package:smartspend/backend/wyrm/database.dart';
import 'package:smartspend/backend/user.dart';

void main() async {
  DB database = DB(name: 'wyrm');
  User client = await initClient(database);
  runApp(MaterialApp(
    home: BoardingPage(
      client: client,
      title: "SmartSpend",
    ),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}

Future<User> initClient(DB database) async {
  User client;
  try {
    client = (await database.users()).first;
  } catch (e) {
    client = User(
      userID: 1,
      name: "",
      passcode: "",
      birthDate: "",
      newUser: 0,
      monthlyIncome: 0);
    database.insertToTable(client, 'user');
  }
  return client;
}