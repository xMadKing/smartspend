import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartspend/backend/user.dart';

class DB {
  final String name;
  late Database database;
  
  DB({required this.name}) {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> initDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), '$name.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user(userID INT PRIMARY KEY, '
                'name TEXT, passcode TEXT, birthDate TEXT, '
                'isNewUser TINYINT, monthlyincome DECIMAL)');
      },
      version: 1,
    );
  }

  Future<void> insertToTable(dynamic entry, String table) async {
    await initDB();
    final db = database;

    await db.insert(
        table, entry.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
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

    await db.update(
      table,
      entry.toMap(),
      where: '$keyName = ?',
      whereArgs: [key]
    );
  }

  Future<void> deleteDatabase() async {
    databaseFactory.deleteDatabase(join(await getDatabasesPath(), '$name.db'));
  }
}