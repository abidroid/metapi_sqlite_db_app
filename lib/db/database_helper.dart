

// all interactions with DB
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/student.dart';

class DatabaseHelper {

  // Boiler Plate code

  // database
  // singleton ( Design Patterns )
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/metapi.db';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_student (
                  cnic TEXT PRIMARY KEY,
                  name TEXT NOT NULL,
                  course TEXT NOT NULL,
                  lastQualification TEXT NOT NULL,
                  mobile TEXT
                   );
    ''');
  }

  // Save Student
  // method
  Future<int> saveStudentToDB( Student student ) async {

    Database database = await this.database;

    // int result = await  database.rawInsert('''
    //   INSERT INTO tbl_student ( cnic, name, course, lastQualification, mobile)
    //   VALUES ( ?,?,?,?,? )
    // ''', [student.cnic, student.name, student.course, student.lastQualification, student.mobile] );



    int result2 = await database.insert('tbl_student', student.toMap());
    return result2;
  }


   Future<List<Map<String, dynamic>>> getAllStudents() async {

    // get all students from Database table
     Database database = await this.database;
     //await Future.delayed(Duration(seconds: 3));

    //return await database.rawQuery('SELECT * from tbl_student');
     //await Future.delayed(Duration(seconds: 2));
    return await database.query('tbl_student');
  }

  Future<int> deleteStudent( String cnic) async {
    Database database = await this.database;

    return await database.rawDelete('DELETE FROM tbl_student where cnic=?', [cnic]);
  }


  // Save Student
  // method
  Future<int> updateStudentToDB( Student student ) async {

    Database database = await this.database;

    int result = await  database.rawUpdate('''
      UPDATE tbl_student set 
      name=?, lastQualification=?, course=?, mobile=? where cnic=?
    ''', [student.name, student.lastQualification, student.course, student.mobile, student.cnic] );

    return result;
  }
}