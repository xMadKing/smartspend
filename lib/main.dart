import 'package:flutter/material.dart';
import 'package:smartspend/pages/onboardingpage.dart';
import 'package:smartspend/backend/wyrm/database.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/category.dart';

void main() async {
  Wyrm database = Wyrm();
  User client = await initClient(database);
  List<Category> categories = await initCategories(database, client);
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
      monthlyIncome: 30000);
    database.insertToTable(client, 'user');
  }
  return client;
}

Future<List<Category>> initCategories(Wyrm database, User client) async {
  List<Category> categories = await database.categories();
  if (categories.length < 4){
    categories = [
      Category(
        userID: client.userID,
        categoryID: 0,
        categoryName: 'Food',
        categoryColor: Colors.blue.value,
        spendingLimit: 10000,
        currentSpending: 0,
      ),
      Category(
        userID: client.userID,
        categoryID: 1,
        categoryName: 'Entertainment',
        categoryColor: Colors.green.shade600.value,
        spendingLimit: 10000,
        currentSpending: 0,
      ),
      Category(
        userID: client.userID,
        categoryID: 2,
        categoryName: 'Medical',
        categoryColor: Colors.orangeAccent.value,
        spendingLimit: 10000,
        currentSpending: 0,
      ),
      Category(
        userID: client.userID,
        categoryID: 3,
        categoryName: 'Transportation',
        categoryColor: Colors.blueGrey.shade600.value,
        spendingLimit: 10000,
        currentSpending: 0,
      )
    ];
    for (int i = 0; i < categories.length; i++){
      await database.insertToTable(categories[i], 'category');
      await database.insertToTable({
        "categoryID" : categories[i].categoryID,
        "Monday" : 1,
        "Tuesday" : 1,
        "Wednesday" : 1,
        "Thursday" : 1,
        "Friday" : 1,
        "Saturday" : 1,
        "Sunday" : 1,
      },
      "weeklyspending");
    }
  }
  return categories;
}