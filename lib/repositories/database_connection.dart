import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseConnection {
  setDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db_fnote');
    Database database =
        await openDatabase(path, version: 2, onCreate: _onCreatingDatabase);
    return database;
  }

  // create table notes
  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT)");
  }
}
