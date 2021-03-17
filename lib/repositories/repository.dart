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

  // insert data
  insertData(table, data) async {
    Database connection = await database;
    return await connection.insert(table, data);
  }

  // read data
  readData(table, column) async {
    Database connection = await database;
    return await connection.query(
      table,
      orderBy: column + ' DESC',
    );
  }

  // read data by column
  readDataByColumn(table, column, value) async {
    Database connection = await database;
    return await connection
        .query(table, where: '$column=?', whereArgs: [value]);
  }

  // update data
  updateData(table, data) async {
    Database connection = await database;
    return await connection
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  // delete data
  deleteData(table, id) async {
    Database connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $id");
  }
}
