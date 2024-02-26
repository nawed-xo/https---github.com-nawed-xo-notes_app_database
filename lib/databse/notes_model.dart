import 'package:notes_app/databse/app_databse.dart';

class Notes_Model {
  int? id;
  String title;
  String desc;

  Notes_Model({this.id, required this.title, required this.desc});

  ///FROM MAP

  factory Notes_Model.fromMap(Map<String, dynamic> map) {
    return Notes_Model(
        title: map[DbHelper.Column_title],
        desc: map[DbHelper.Column_desc],
        id: map[DbHelper.Column_id]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.Column_id: id,
      DbHelper.Column_title: title,
      DbHelper.Column_desc: desc
    };
  }
}
