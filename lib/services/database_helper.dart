import 'package:debtrackr/Models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Notes.db";
  

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE IF NOT EXISTS Note(id INTEGER PRIMARY KEY, amount INTEGER , title TEXT NOT NULL, description TEXT NOT NULL);");
      await db.execute(
          "CREATE TABLE IF NOT EXISTS Dues(id INTEGER PRIMARY KEY, amount INTEGER , title TEXT NOT NULL, description TEXT NOT NULL);");
    }, version: _version);
  }


  static Future<int> addCredit(Note note) async {
    final db = await _getDB();
    return await db.insert("Note", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> addDEbt(Note note) async {
    final db = await _getDB();
    return await db.insert("Dues", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCredit(Note note) async {
    final db = await _getDB();
    return await db.update("Note", note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateDues(Note note) async {
    final db = await _getDB();
    return await db.update("Dues", note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCredit(Note note) async {
    final db = await _getDB();
    return await db.delete(
      "Note",
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<int> deleteDues(Note note) async {
    final db = await _getDB();
    return await db.delete(
      "Dues",
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<List<Note>?> getAllCredits() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Note");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }

  static Future<List<Note>?> getAllDues() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Dues");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }

static sumColumn(String columnName, String tableName) async {
  final db = await _getDB();
  final result = await db.rawQuery('SELECT SUM($columnName) FROM $tableName;');
  return Sqflite.firstIntValue(result) ?? 0;
}

  static Future<void> deleteAllDues() async {
    final db = await _getDB();
    await db.delete('Dues'); // Delete all rows from the 'Dues' table
  }

  static Future<void> deleteAllCredits() async {
    final db = await _getDB();
    await db.delete('Note'); // Delete all rows from the 'Dues' table
  }

  static void reset(){
    deleteAllCredits();
    deleteAllDues();
  }
}
