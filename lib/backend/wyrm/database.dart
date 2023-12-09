import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
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
          'CREATE TABLE weeklyspending('
          'categoryID INT,'
          'Monday DECIMAL,'
          'Tuesday DECIMAL,'
          'Wednesday DECIMAL,'
          'Thursday DECIMAL,'
          'Friday DECIMAL,'
          'Saturday DECIMAL,'
          'Sunday DECIMAL,'
          'FOREIGN KEY (categoryID) REFERENCES category(categoryID))'
        );
        return;
      },
      version: 1,
    );
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

  Future<List<Map<String, num>>> weeklySpending(int categoryID) async {
    await initDB();
    final db = database;

    final List<Map<String, dynamic>> maps = await db.query('weeklyspending',
    where: 'categoryID = ?', whereArgs: [categoryID]);

    return List.generate(maps.length, (i) {
      return {
        "categoryID" : maps[i]['categoryID'] as int,
        "Monday" : maps[i]['Monday'] as num,
        "Tuesday" : maps[i]['Tuesday'] as num,
        "Wednesday" : maps[i]['Wednesday'] as num,
        "Thursday" : maps[i]['Thursday'] as num,
        "Friday" : maps[i]['Friday'] as num,
        "Saturday" : maps[i]['Saturday'] as num,
        "Sunday" : maps[i]['Sunday'] as num,
      };
    });
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