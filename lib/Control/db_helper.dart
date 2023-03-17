import 'dart:io';
import 'package:lec_14_15/linker.dart';
import  'package:path/path.dart' ;
import 'package:sqflite/sqflite.dart' ;
import 'package:path_provider/path_provider.dart';

class DBHelper {
//_____________________________private consturctor

  DBHelper._privateConstructor();

//______________________________Instanse of provate constructor

  static final DBHelper dbIstance = DBHelper._privateConstructor();

//__________________________________Database Instance

  static Database? _database;

// ________________________________________Checking Database

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

//__________________________________initialization database
  _initDatabase() async {
    Directory doccumentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(doccumentsDirectory.path, 'Note.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

//___________________________________create table, _oncreate()

  _onCreate(Database db, int version) {
    db.execute(
'''Create Table note (
  id integer primary key,
  title text not null,
  message text not null,
  date text not null
)'''
    );
  }

//_______________________________________insert valuers,

  create(Note newNote) async {
    var jasonData = {
      'title': newNote.title,
      'message': newNote.message,
      'date': newNote.date
    };

    Database? db = await dbIstance.database;

    int? id = await db!.insert('note', jasonData);

    // if (id == null) {
    //   print("not saved");
    // } else
    //   print("data saved");
  }

//__________________________reading data
  read() async {
    Database? db = await dbIstance.database;

    return db!.query('note');
  }

//_________________________update data
  update(Note newData, int id) async {
    Database? db = await dbIstance.database;

    Map<String, dynamic> jasonData = {
      'title': newData.title,
      'message': newData.message,
      'date': newData.date
    };
    db!.update('note', jasonData, where: 'id=?', whereArgs: [id]);
  }

//_______________________________delete Data
  delete(int id) async {
    Database? db = await dbIstance.database;
    db!.delete('note', where: 'id=?', whereArgs: [id]);
  }
}
