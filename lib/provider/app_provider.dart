import 'package:flutter/material.dart';
import 'package:notes_app/databse/app_databse.dart';
import 'package:notes_app/databse/notes_model.dart';

class notes_provider extends ChangeNotifier {
  DbHelper db = DbHelper.db;
  List<Notes_Model> arrNotes = [];

  void fetchAllNotes() async {
    arrNotes = await db.fetchAlldata();
    notifyListeners();
  }

  List<Notes_Model> getAllNotes() {
    fetchAllNotes();
    return arrNotes;
  }

  addAllNotes(Notes_Model newNotes) async {
    await db.addNotes(newNotes);
    getAllNotes();
    notifyListeners();
  }

  updateAllNotes(Notes_Model notesUpdate) async {
    await db.updateNotes(notesUpdate);
    getAllNotes();
    notifyListeners();
  }

  deleteAllNotes(int id) async {
    await db.deleteNotes(id);
    getAllNotes();
    notifyListeners();
  }
}
