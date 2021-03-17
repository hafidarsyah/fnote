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

  readData(table, column) async {
    Database connection = await database;
    return await connection.query(
      table,
      orderBy: column + ' DESC',
    );
  }

  readDataByColumn(table, column, value) async {
    Database connection = await database;
    return await connection
        .query(table, where: '$column=?', whereArgs: [value]);
  }

  updateData(table, data) async {
    Database connection = await database;
    return await connection
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteData(table, id) async {
    Database connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $id");
  }
}
