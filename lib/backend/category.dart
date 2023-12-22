import 'package:flutter/widgets.dart';
import 'package:graphic/graphic.dart';
import 'wyrm/database.dart';
import 'package:smartspend/backend/payments.dart';

class Category {
  static final Wyrm database = Wyrm();
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

  static List<DateTime> getWeekDates() {
    final List<DateTime> res = [];
    DateTime mostRecentWeekday(DateTime date, int weekday) => //code from stackoverflow, thanks Irn
        DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);
    DateTime monday = mostRecentWeekday(DateTime.now(), 1);
    res.add(monday);
    for(int i = 1; i < 7; i++){
      res.add(monday.add(Duration(days: i)));
    }
    return res;
  }

  Future<Map<String, num>> getWeekSpending() async {
    final Map<String, num> res = {};
    final List<DateTime> thisWeekDates = getWeekDates();
    List<List<Payment>> paymentsPerDay = await database.getPaymentsByDate(thisWeekDates, categoryID);

    for(int i = 0; i < paymentsPerDay.length; i++){
      String date;
      try {
        date = DateTime.parse(paymentsPerDay[i].first.paymentDate).day.toString();
      } catch (e) {
        date = thisWeekDates[i].day.toString();
      }

      num amountSpent = 0;
      for(int j = 0; j < paymentsPerDay[i].length; j++){
        amountSpent += paymentsPerDay[i][j].paymentAmount;
      }
      res[date] = amountSpent;
    }
    return res;
  }

  Future<void> addExpense(String date, num amount) async {
    currentSpending += amount;

    Payment expense = Payment(
        paymentID: DateTime.now().millisecondsSinceEpoch.toInt(),
        categoryID: categoryID,
        paymentDate: date,
        paymentAmount: amount,
    );

    await database.insertToTable(
        expense,
        'payment'
    );

    await database.updateEntryInTable(
        'category',
       'categoryID',
        categoryID,
        this,
    );

  }

  @override
  String toString() {
    Color tmp = Color(categoryColor);
    return "Category{ID: $categoryID, userID: $userID, Color: $tmp, "
        "Category Name: $categoryName, Spending Limit: $spendingLimit, "
        "Current Spending: $currentSpending}";
  }
}