import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "rnw.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE incomeexpence (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,amount TEXT,notes TEXT,date TEXT,time TEXT,types TEXT,status INTEGER)";
        db.execute(query);

        String query1 = "CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT , category TEXT)";
        db.execute(query1);
      },
    );
  }

  Future<List<Map>> readIncome() async {

    database = await checkDB();

    String query = "SELECT * FROM incomeexpence WHERE status = 0";
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }
  Future<List<Map>> readExpense() async {

    database = await checkDB();

    String query = "SELECT * FROM incomeexpence WHERE status = 1";
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }
  Future<List<Map>> readDB2() async {
    database = await checkDB();

    print("================================read");

    String query = "SELECT * FROM categry";
    List<Map> l1 = await database!.rawQuery(query);

    print(l1);
    return l1;
  }

  void insertData(
      {required category,
        required notes,
        required status,
        required amount,
        required types,
        required date,
        required time}) async {
    database = await checkDB();
    database!.insert("incomeexpence", {
      "category": category,
      "amount": amount,
      "notes": notes,
      "date": date,
      "time": time,
      "status": status,
      "types": types
    });
  }

  Future<void> insertcatagory({required category})
  async {
    database = await checkDB();
    database!.insert("category", {"category":category});
  }
  Future<List<Map>> readData() async {
    database = await checkDB();
    String query = "SELECT * FROM incomeexpence";
    List<Map> list = await database!.rawQuery(query);
    print(list);
    return list;
  }

  Future<List<Map>> filterRead({required statusCode}) async {
    database = await checkDB();
    var query = "SELECT * FROM incomeexpence WHERE status=$statusCode";
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }
  Future<void> deleteData({required id})
  async {
    database = await checkDB();
    database!.delete("incomeexpence",where: "id=?",whereArgs: [id]);
  }
  Future<void> updateDatabase(
      {required category,
        required notes,
        required status,
        required amount,
        required types,
        required id,
        required date,
        required time}) async {
    database = await checkDB();
    database!.update(
        'incomeexpense',
        {
          "category": category,
          "id":id,
          "amount": amount,
          "notes": notes,
          "date": date,
          "time": time,
          "status": status,
          "types": types
        },
        where: 'id=?',
        whereArgs: [id]);
  }
}