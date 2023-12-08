import 'package:flutter/widgets.dart';

class Category {
  late final int userID;
  late final int categoryID;
  late final num spendingLimit;
  late num currentSpending;
  late int categoryColor;
  late String categoryName;

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

  @override
  String toString() {
    Color tmp = Color(categoryColor);
    return "Category{ID: $categoryID, userID: $userID, Color: $tmp, "
        "Category Name: $categoryName, Spending Limit: $spendingLimit, "
        "Current Spending: $currentSpending}";
  }
}