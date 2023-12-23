import 'package:fl_chart/fl_chart.dart';
import 'package:quiver/time.dart';
import 'package:smartspend/backend/payments.dart';
import 'package:smartspend/backend/wyrm/database.dart';

class User {
  final int userID;
  String name;
  String birthDate;
  String passcode; // not a very secure way to store a password, idk if this is ok
  int newUser;
  num monthlyIncome;

  User({
    required this.userID,
    required this.name,
    required this.passcode,
    required this.birthDate,
    required this.newUser,
    required this.monthlyIncome,
  });

  static List<DateTime> getMonthDates() {
    final List<DateTime> res = [];
    DateTime date = DateTime.now();
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    for(int i = 0; i < daysInMonth(date.year, date.month); i++){
      res.add(firstDayOfMonth.add(Duration(days: i)));
    }
    return res;
  }

  Future<List<FlSpot>> getTrajectory() async {
    final Wyrm database = Wyrm();
    final List<FlSpot> res = [];
    final List<DateTime> dates = getMonthDates();
    List<List<Payment>> paymentsPerDay = await database.getMonthlyPayments(dates);

    for(int i = 0; i < paymentsPerDay.length; i++){
      String date;
      try {
        date = DateTime.parse(paymentsPerDay[i].first.paymentDate).day.toString();
      } catch (e) {
        date = dates[i].day.toString();
      }
      num amountSpent = 0;
      for(int j = 0; j < paymentsPerDay[i].length; j++){
        amountSpent += paymentsPerDay[i][j].paymentAmount;
      }
      res.add(FlSpot(double.parse(date)-1, amountSpent.toDouble()));
    }
    return res;
  }

  Map<String, dynamic> toMap() {
    return {
      "userID" : userID,
      "name" : name,
      "passcode" : passcode,
      "birthDate" : birthDate,
      "isNewUser" : newUser,
      "monthlyincome" : monthlyIncome,
    };
  }

  @override
  String toString(){
    return 'User{ID: $userID, name : $name, passcode: $passcode, birth date: $birthDate'
        ' isNewUser: $newUser, Monthly income: $monthlyIncome}';
  }
}

