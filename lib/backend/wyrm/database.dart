import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:smartspend/backend/payments.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/category.dart';


class Wyrm {
  final String name = "wyrm";
  late Database database;
  
  Wyrm() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> initDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), '$name.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user'
          '(userID INT PRIMARY KEY,'
          'name TEXT,'
          'passcode TEXT,'
          'birthDate TEXT,'
          'isNewUser TINYINT,'
          'monthlyincome DECIMAL)'
        );
        await db.execute(
          'CREATE TABLE category'
          '(categoryID INT PRIMARY KEY,'
          'userID INT,'
          'categoryName TEXT,'
          'spendingLimit DECIMAL,'
          'currentSpending DECIMAL,'
          'categoryColor INT)'
        );
        await db.execute(
          'CREATE TABLE payment('
          'paymentID INT,'
          'categoryID INT,'
          'paymentDate STRING,'
          'paymentAmount DECIMAL)'
        );
        return;
      },
      version: 1,
    );
  }

  Future<List<List<Payment>>> getPaymentsByDate
      (List<DateTime> dates, int categoryID) async {
    await initDB();
    final db = database;

    final List<List<Payment>> res = [];

     for(int j = 0; j < dates.length; j++){
      final List<Map<String, dynamic>> data = await db.query(
        'payment',
        where: "paymentDate=? and categoryID=? ",
        whereArgs: ["${dates[j].year}-${dates[j].month}-${dates[j].day}".toString(), categoryID],
      );
      List<Payment> tmp = [];
      for (int i = 0; i < data.length; i++){
        tmp.add(Payment(
          paymentID: data[i]['paymentID'] as int,
          categoryID: data[i]['categoryID'] as int ,
          paymentDate: data[i]['paymentDate'] as String,
          paymentAmount: data[i]['paymentAmount'] as num,
        ));
      }
      res.add(tmp);
    }

    return res;
  }

  Future<List<List<Payment>>> getMonthlyPayments(List<DateTime> dates) async {
    await initDB();
    final db = database;

    final List<List<Payment>> res = [];

    for(int j = 0; j < dates.length; j++){
      final List<Map<String, dynamic>> data = await db.query(
        'payment',
        where: "paymentDate=?",
        whereArgs: ["${dates[j].year}-${dates[j].month}-${dates[j].day}".toString()],
      );
      List<Payment> tmp = [];
      for (int i = 0; i < data.length; i++){
        tmp.add(Payment(
          paymentID: data[i]['paymentID'] as int,
          categoryID: data[i]['categoryID'] as int ,
          paymentDate: data[i]['paymentDate'] as String,
          paymentAmount: data[i]['paymentAmount'] as num,
        ));
      }
      res.add(tmp);
    }

    return res;
  }

  Future<void> insertToTable(dynamic entry, String table) async {
    await initDB();
    final db = database;

    Map<String, dynamic> data;

    try {
      data = entry.toMap();
    } catch (e) {
      data = entry;
    }

    await db.insert(
        table, data,
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Category>> categories() async {
    await initDB();
    final db = database;

    final List<Map<String, dynamic>> maps = await db.query('category');

    return List.generate(maps.length, (i) {
      return Category(
          userID: maps[i]['userID'] as int,
          categoryID: maps[i]['categoryID'] as int,
          categoryName: maps[i]['categoryName'] as String,
          categoryColor: maps[i]['categoryColor'] as int,
          spendingLimit: maps[i]['spendingLimit'] as num,
          currentSpending: maps[i]['currentSpending'] as num,
      );
    });
  }

  Future<List<Payment>> payments() async {
    await initDB();
    final db = database;

    final List<Map<String, dynamic>> maps = await db.query("payment");

    return List.generate(maps.length, (i) {
      return Payment(
          paymentID: maps[i]['paymentID'] as int,
          categoryID: maps[i]['categoryID'] as int ,
          paymentDate: maps[i]['paymentDate'] as String,
          paymentAmount: maps[i]['paymentAmount'] as num,
      );
    });
  }

  Future<List<User>> users() async {
    await initDB();
    final db = database;

    final List<Map<String, dynamic>> maps = await db.query('user');

    return List.generate(maps.length, (i) {
      return User(
        userID: maps[i]['userID'] as int,
        name: maps[i]['name'] as String,
        passcode: maps[i]['passcode'] as String,
        birthDate: maps[i]['birthDate'] as String,
        newUser: maps[i]['isNewUser'] as int,
        monthlyIncome: maps[i]['monthlyincome'] as num,
      );
    });
  }

  Future<void> deleteFromTable
      (String keyName, String table, dynamic key) async {
    // Get a reference to the database.
    await initDB();
    final db = database;

    await db.delete(
      table,
      where: '$keyName = ?',
      whereArgs: [key],
    );
  }

  Future<void> updateEntryInTable
      (String table, String keyName, dynamic key, dynamic entry) async {
    await initDB();
    final db = database;
    Map<String, dynamic> data;

    try {
      data = entry.toMap();
    } catch (e) {
      data = entry;
    }

    await db.update(
      table,
      data,
      where: '$keyName = ?',
      whereArgs: [key]
    );
  }

  Future<void> deleteDatabase() async {
    databaseFactory.deleteDatabase(join(await getDatabasesPath(), '$name.db'));
  }
}