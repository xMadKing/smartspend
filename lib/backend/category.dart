import 'package:flutter/widgets.dart';
import 'wyrm/database.dart';

class Category {
  static final Wyrm database = Wyrm();
  late final int userID;
  late final int categoryID;
  late final num spendingLimit;
  late num currentSpending;
  late int categoryColor;
  late String categoryName;
  late Map<String, num> lastWeekSpending = {
    "Monday" : 1,
    "Tuesday" : 1,
    "Wednesday" : 1,
    "Thursday" : 1,
    "Friday" : 1,
    "Saturday" : 1,
    "Sunday" : 1 ,
  };

  Category({
    required this.userID,
    required this.categoryID,
    required this.categoryName,
    required this.categoryColor,
    required this.spendingLimit,
    this.currentSpending = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "categoryID": categoryID,
      "categoryName": categoryName,
      "spendingLimit": spendingLimit,
      "currentSpending": currentSpending,
      "categoryColor": categoryColor,
    };
  }

  Future<void> addExpense(String day, num expense) async {
    await loadSpending();
    lastWeekSpending[day] = lastWeekSpending[day] !+ expense;
    currentSpending += expense;

    Map<String, dynamic> data = {
      "categoryID" : categoryID,
    };

    for (var key in lastWeekSpending.keys) {
      data[key] = lastWeekSpending[key];
    }

    await database.updateEntryInTable(
        'weeklyspending',
        'categoryID',
        categoryID,
        data,
    );

    await database.updateEntryInTable(
        'category',
       'categoryID',
        categoryID,
        this,
    );

  }

  Future<void> loadSpending() async {
    Map<String, dynamic> data = (await database.weeklySpending(categoryID)).first;
    lastWeekSpending = {
      "Monday" : data['Monday'],
      "Tuesday" : data['Tuesday'],
      "Wednesday" : data['Wednesday'],
      "Thursday" : data['Thursday'],
      "Friday" : data['Friday'],
      "Saturday" : data['Saturday'],
      "Sunday" : data['Sunday'],
    };
  }

  @override
  String toString() {
    Color tmp = Color(categoryColor);
    return "Category{ID: $categoryID, userID: $userID, Color: $tmp, "
        "Category Name: $categoryName, Spending Limit: $spendingLimit, "
        "Current Spending: $currentSpending, weekly: $lastWeekSpending}";
  }
}