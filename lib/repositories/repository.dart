import 'package:sqflite/sqflite.dart';
import 'database_connection.dart';

class Repository {
  DatabaseConnection _databaseConnection = DatabaseConnection();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    Database connection = await database;
    return await connection.insert(table, data);
  }
}
