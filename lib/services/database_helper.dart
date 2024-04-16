import 'package:debtrackr/DataModel/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabsaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Credits.db';

  static Future<Database> _getDB() async {
    return openDatabase(p.join(await getDatabasesPath(), _dbName),
    version: _version,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL, amount INTEGER)');
    });
  }

  static Future<int> addNote(Note note) async {
    final db = await _getDB();
    return await db.insert("Credit", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(Note note) async {
    final db = await _getDB();
    return await db.update("Credit", note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteNote(Note note) async {
    final db = await _getDB();
    return await db.delete(
      "Credit",
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<List<Note>?> getAllNode() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Note");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
}
