import 'dart:async';

import 'package:demo_1/local/my_dao.dart';
import 'package:demo_1/modal/modal.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version:1,entities: [User])
abstract class UserDatabase extends FloorDatabase {
  UserDAO get userDAO;
}