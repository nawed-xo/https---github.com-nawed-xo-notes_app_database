import 'dart:io';
import 'package:notes_app/databse/notes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbHelper {
  DbHelper._();

  static final DbHelper db = DbHelper._();

  Database? _database;

  //CREATING THE TABLE

  static const Note_table = "note_table";
  static const Column_id = "note_id";
  static const Column_title = "note_title";
  static const Column_desc = "note_desc";

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  //CREATING THE PATH

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();

    var dbpath = join(directory.path, "noteDB.db");

    return openDatabase(
      dbpath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "Create table $Note_table ( $Column_id integer primary key autoincrement, $Column_title text, $Column_desc text )");
      },
    );
  }

  //ADDING THE DATA TO DATABASE

  Future<void> addNotes(Notes_Model newNotes) async {
    var db = await getDb();
    await db.insert(Note_table, newNotes.toMap());
  }

  //FETTCHING THE DATA FROM DATABASE

  Future<List<Notes_Model>> fetchAlldata() async {
    var db = await getDb();
    List<Map<String, dynamic>> notes = await db.query(Note_table);
    List<Notes_Model> listNotes = [];
    for (Map<String, dynamic> note in notes) {
      Notes_Model model = Notes_Model.fromMap(note);
      listNotes.add(model);
    }
    return listNotes;
  }
}
