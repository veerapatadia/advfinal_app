import 'dart:developer';
import 'package:advfinalapp/model/usermodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  Future<void> initializeDB() async {
    String directoryPath = await getDatabasesPath();
    String path = join(directoryPath, "adv.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String userQuery =
            "CREATE TABLE IF NOT EXISTS Users(user_username TEXT, user_password TEXT,user_email TEXT,user_id INTEGER PRIMARY KEY) VALUES(?,?,?,?);";
        await db.execute(userQuery);

        log("===========");
        log("User created");
        log("===========");
      },
    );
  }

  Future<int> insertUser({required Users user}) async {
    if (db == null) {
      await initializeDB();
    }
    String insQuery =
        "INSERT INTO Users(user_username,user_email,user_password,user_id) VALUES(?,?,?,?);";
    List argument = [user.password, user.email, user.username, user.id];

    int? id = await db?.rawInsert(insQuery, argument);
    return id!;
  }

  Future<List<Users>?> fetchUsers() async {
    if (db == null) {
      await initializeDB();
    }
    String fetchQuery = "SELECT * FROM users";

    List<Map<String, dynamic>> record = await db!.rawQuery(fetchQuery);

    List<Users> allUsers =
        record.map((Map<String, dynamic> e) => Users.fromMap(data: e)).toList();

    return allUsers;
  }
}
