import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    print("Created 1");
    try {
      var databasesPath = await getDatabasesPath();
      await deleteDatabase(databasesPath);
      String path = join(databasesPath, 'places.db');
      return await openDatabase(path, version: 2,
          onCreate: (Database db, int version) async {
            await db.execute("""
          CREATE TABLE IF NOT EXISTS user_places ( 
          id TEXT PRIMARY KEY,
          title TEXT,
          image TEXT
          );
          """);
          });
    } catch (error) {
      print(error);
    }
  }

  Future<void> insertPlaces(String id, String title, String image) async {
    print("New User Session");
    try {
      final db = await database;

      var res = await db.rawInsert(''' 
    INSERT INTO user_places (
    id,title,image
    ) VALUES (?,?,?)
    ''', [id, title, image]);
      return res;
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteUserSession() async {
    print("New User Session");
    try {
      final db = await database;
      var delete = await db.rawInsert( '''DELETE FROM user_places''');
      print("Deleted Session");
    } catch (error) {
      print(error);
    }
  }

  Future<List<Map<String,dynamic>>> getPlaces() async {
    final db = await database;
    var res = await db.query("user_places");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? res : null;
    }
  }
}