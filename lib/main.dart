import 'package:flutter/material.dart';
import 'package:smartspend/pages/onboardingpage.dart';
import 'package:smartspend/backend/wyrm/database.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/category.dart';

void main() async {
  Wyrm database = Wyrm();
  User client = await initClient(database);
  Category food = Category(
      userID: client.userID,
      categoryID: 0,
      categoryName: 'Food',
      categoryColor: Colors.blue.value,
      spendingLimit: 10000,
      currentSpending: 0,
  );
  await database.insertToTable(food, 'category');
  print(await database.users());
  print(await database.categories());
  runApp(MaterialApp(
    home: BoardingPage(
      client: client,
      title: "SmartSpend",
    ),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}

Future<User> initClient(Wyrm database) async {
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